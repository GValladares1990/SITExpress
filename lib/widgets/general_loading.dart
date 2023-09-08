import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitexpress/providers/providers.dart';

class MGeneralLoading extends ConsumerWidget {
  const MGeneralLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const contentWidth = 200.0;
    const contentHeight = 200.0;
    final colorContent = Colors.black.withOpacity(0.6);

    final canShould = ref.watch(loadingProvider);

    return !canShould
        ? Container()
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.1)),
                  ),
                ),
                Center(
                  child: Container(
                    height: contentHeight,
                    width: contentWidth,
                    padding: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: colorContent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        SizedBox(height: 25.0),
                        Text(
                          'Cargando',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
