import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/hashtag_parser.dart';
import '../constants/app_colors.dart';

class ScreenB extends StatelessWidget {
  final String? phrase;
  final String? hashtags;

  const ScreenB({super.key, this.phrase, this.hashtags});
  TextSpan _buildHighlightedSpan(String text) {
    final words = text.split(RegExp(r'(\s+)'));
    final children = <TextSpan>[];

    for (final w in words) {
      if (w.trim().isEmpty) {
        children.add(TextSpan(text: w));
        continue;
      }
      if (HashtagParser.hashtagRegex.hasMatch(w)) {
        children.add(
          TextSpan(
            text: w,
            style: const TextStyle(
              color: AppColors.hashtagColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else {
        children.add(
          TextSpan(
            text: w,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
        );
      }
    }

    return TextSpan(children: children, style: const TextStyle(fontSize: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen B'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () => context.pushNamed('c'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      'Go to Screen C',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              if (phrase != null && phrase!.isNotEmpty) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phrase:',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLabel,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: RichText(text: _buildHighlightedSpan(phrase!)),
                ),
                const SizedBox(height: 18),
              ],
              if (hashtags != null && hashtags!.isNotEmpty) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hashtags:',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLabel,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: RichText(text: _buildHighlightedSpan(hashtags!)),
                ),
                const SizedBox(height: 18),
              ],
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          content: const Text('Congratulations 🎉'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                                // Navigate back to Screen A after dismissing dialog
                                context.goNamed('a');
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 32.0,
                      ),
                      child: Text('Done', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
