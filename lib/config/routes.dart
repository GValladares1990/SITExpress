import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sitexpress/presentations/presentations.dart';
import 'package:sitexpress/providers/providers.dart';
import 'package:sitexpress/widgets/widgets.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final didShowedSplashPage = ref.watch(didShowSplashProvider);

  return GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: SplashPage.routeLocation,
    redirect: (context, state) {
      if (!didShowedSplashPage) {
        return null;
      }

      var isAuth = authState.isAuth;

      if (!isAuth) {
        return LoginPage.routeLocation;
      }

      if ([SplashPage.routeLocation, LoginPage.routeLocation]
          .contains(state.fullPath)) {
        return DashboardPage.routeLocation;
      }

      return state.fullPath;
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
      GoRoute(
        name: TickerPage.routeName,
        path: TickerPage.routeLocation,
        builder: (_, __) {
          return const TickerPage();
        },
      ),
    ],
  );
});
