import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitexpress/providers/auth_provider.dart';
import 'package:sitexpress/utils/adaptive_selector_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _SelectorWidget(
          usernameController: usernameController,
          passwordController: passwordController,
          ref: ref,
        ),
      ),
    );
  }
}

class _SelectorWidget extends StatelessWidget {
  const _SelectorWidget({
    required this.usernameController,
    required this.passwordController,
    required this.ref,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: adaptiveSelectorWidget(
            narrow: LoginPanelView(
              usernameController: usernameController,
              passwordController: passwordController,
              ref: ref,
            ),
            wide: LoginPanelScrollable(
              usernameController: usernameController,
              passwordController: passwordController,
              ref: ref,
            ),
            isNarrow: !constraints.isTablet,
          ),
        );
      },
    );
  }
}

class LoginPanelScrollable extends StatelessWidget {
  const LoginPanelScrollable({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.ref,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LoginPanelView(
        usernameController: usernameController,
        passwordController: passwordController,
        ref: ref,
      ),
    );
  }
}

class LoginPanelView extends StatelessWidget {
  const LoginPanelView({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.ref,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 400,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'SITExpress',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20.0),
          MTextField(
            controller: usernameController,
            hintText: 'Usuario',
          ),
          const SizedBox(height: 10.0),
          MTextField(
            controller: passwordController,
            obscureText: true,
            hintText: 'Contraseña',
          ),
          const SizedBox(height: 20.0),
          MPrimaryButton(
            title: 'Iniciar sesión',
            onTap: () {
              final auth = ref.read(authProvider);
              auth.login(usernameController.text);
            },
          ),
        ],
      ),
    );
  }
}
