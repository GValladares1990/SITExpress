import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sitexpress/providers/auth_provider.dart';
import 'package:sitexpress/providers/loading_provider.dart';
import '../../widgets/widgets.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static String get routeName => 'login';
  static String get routeLocation => '/$routeName';

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void toggleLoading() {
    void setterState(bool boolean) {
      ref.read(loadingProvider.notifier).state = boolean;
    }

    setterState(true);

    Timer(const Duration(seconds: 2), () {
      setterState(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'SITExpress',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 50.0),
            MTextField(
              controller: usernameController,
              hintText: 'Usuario',
            ),
            const SizedBox(height: 20.0),
            MTextField(
              controller: passwordController,
              obscureText: true,
              hintText: 'Contraseña',
            ),
            const SizedBox(height: 50.0),
            MPrimaryButton(
              title: 'Iniciar sesión',
              onTap: () {
                //context.go('/');
                //toggleLoading();
                final auth = ref.read(authProvider);
                auth.login(usernameController.text);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
