import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitexpress/providers/splash_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  static String get routeName => 'splash';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer(
      const Duration(seconds: 1),
      () => ref.read(didShowSplashProvider.notifier).state = true,
    );

    return const Scaffold(
      body: Center(
        child: Text(
          'SITExpress',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
