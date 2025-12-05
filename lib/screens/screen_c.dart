import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/hashtag_parser.dart';
import '../constants/app_colors.dart';

class ScreenC extends StatefulWidget {
  const ScreenC({super.key});

  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  final TextEditingController _phraseController = TextEditingController();
  final TextEditingController _hashtagsController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _phraseController.addListener(_onPhraseChanged);
  }

  @override
  void dispose() {
    _phraseController.removeListener(_onPhraseChanged);
    _phraseController.dispose();
    _hashtagsController.dispose();
    super.dispose();
  }

  void _onPhraseChanged() {
    final text = _phraseController.text;
    final extracted = HashtagParser.extractHashtags(text);

    final newHashtags = extracted.join(' ');

    if (_hashtagsController.text != newHashtags) {
      _hashtagsController.text = newHashtags;
      _hashtagsController.selection = TextSelection.collapsed(
        offset: _hashtagsController.text.length,
      );
    }

    setState(() {});
  }

  TextSpan _buildPhraseSpan(String text) {
    final parts = text.split(RegExp(r'(\s+)')); // keep spaces as tokens
    final children = <TextSpan>[];

    for (final p in parts) {
      if (p.trim().isEmpty) {
        children.add(TextSpan(text: p));
        continue;
      }
      if (HashtagParser.hashtagRegex.hasMatch(p)) {
        children.add(
          TextSpan(
            text: p,
            style: const TextStyle(
              color: AppColors.hashtagColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else {
        children.add(
          TextSpan(
            text: p,
            style: const TextStyle(color: AppColors.textPrimary),
          ),
        );
      }
    }

    return TextSpan(
      style: const TextStyle(fontSize: 16, height: 1.4),
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen C'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Phrase label
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Phrase',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textLabel,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                constraints: const BoxConstraints(minHeight: 80),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: TextField(
                  controller: _phraseController,
                  maxLines: null,
                  cursorColor: AppColors.cursorColor,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    height: 1.5,
                  ),
                  decoration: const InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: 'Type phrase here (use #hashtags)',
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              if (_phraseController.text.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.previewBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: RichText(
                    text: _buildPhraseSpan(_phraseController.text),
                  ),
                ),
              const SizedBox(height: 18),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hashtags',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textLabel,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _hashtagsController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Auto-filled hashtags (editable)',
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ElevatedButton(
                  onPressed: () {
                    final phrase = _phraseController.text.trim();
                    final hashtags = _hashtagsController.text.trim();
                    // Navigate to Screen B and pass data via extra
                    context.goNamed(
                      'b',
                      extra: {'phrase': phrase, 'hashtags': hashtags},
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0,
                    ),
                    child: Text('Submit', style: TextStyle(fontSize: 16)),
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
