import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitexpress/providers/auth_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  static String get routeName => 'dashboard';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SITExpress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeItem(
              title: 'Flow',
              onTap: () {},
            ),
            HomeItem(
                title: 'Cerrar sesión',
                onTap: () {
                  final auth = ref.read(authProvider);
                  auth.logout();
                }),
            HomeItem(title: 'Soporte', onTap: () {}),
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          )),
        ),
      ),
    );
  }
}
