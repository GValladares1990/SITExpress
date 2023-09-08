import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sitexpress/presentations/presentations.dart';
import 'package:sitexpress/providers/providers.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  static String get routeName => 'dashboard';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SITExpress'),
      ),
      body: SafeArea(
        child: Center(
          child: PanelDashboard(height: height, ref: ref),
        ),
      ),
    );
  }
}

class PanelDashboard extends StatelessWidget {
  const PanelDashboard({
    super.key,
    required this.height,
    required this.ref,
  });

  final double height;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 400,
      height: min(300, height),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                HomeItem(
                    title: 'Ticker',
                    onTap: () {
                      context.push(TickerPage.routeLocation);
                    }),
                HomeItem(title: 'Soporte', onTap: () {}),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                HomeItem(title: 'Refrescar', onTap: () {}),
                HomeItem(
                  title: 'Cerrar sesión',
                  onTap: () {
                    final auth = ref.read(authProvider);
                    auth.logout();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const HomeItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                //color: Colors.white,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
