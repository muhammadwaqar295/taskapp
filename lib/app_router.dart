import 'package:go_router/go_router.dart';
import 'screens/screen_a.dart';
import 'screens/screen_b.dart';
import 'screens/screen_c.dart';

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(path: '/', name: 'a', builder: (context, state) => const ScreenA()),
    GoRoute(
      path: '/b',
      name: 'b',
      builder: (context, state) {
        final extra = state.extra;
        String? phrase;
        String? hashtags;
        if (extra is Map<String, dynamic>) {
          phrase = extra['phrase'] as String?;
          hashtags = extra['hashtags'] as String?;
        }
        return ScreenB(phrase: phrase, hashtags: hashtags);
      },
    ),
    GoRoute(
      path: '/c',
      name: 'c',
      builder: (context, state) => const ScreenC(),
    ),
  ],
);
