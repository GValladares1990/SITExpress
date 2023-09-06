import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sitexpress/presentations/presentations.dart';
import 'package:sitexpress/providers/auth_provider.dart';
import 'package:sitexpress/widgets/widgets.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: SplashPage.routeLocation,
    redirect: (context, state) {
      var isAuth = authState.isAuth;

      var isSplash = state.fullPath == SplashPage.routeLocation;
      if (isSplash) {
        return isAuth ? DashboardPage.routeLocation : LoginPage.routeLocation;
      }

      var isLogginIn = state.fullPath == LoginPage.routeLocation;
      if (isLogginIn) return isAuth ? DashboardPage.routeLocation : null;

      return isAuth ? null : SplashPage.routeLocation;
    },
    routes: [
      GoRoute(
        path: SplashPage.routeLocation,
        name: SplashPage.routeName,
        builder: (_, __) {
          return const SplashPage();
        },
      ),
      GoRoute(
        name: DashboardPage.routeName,
        path: DashboardPage.routeLocation,
        builder: (_, __) {
          return const Stack(
            children: [
              DashboardPage(),
            ],
          );
        },
      ),
      GoRoute(
        name: LoginPage.routeName,
        path: LoginPage.routeLocation,
        builder: (_, __) {
          return const Stack(
            children: [
              LoginPage(),
              MGeneralLoading(),
            ],
          );
        },
      ),
    ],
  );
});
