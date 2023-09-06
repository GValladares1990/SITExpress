import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitexpress/providers/loading_provider.dart';

class AuthNotifier extends ChangeNotifier {
  final StateController<bool> loadingState;
  String? username;

  AuthNotifier(this.loadingState);

  bool get isAuth => username?.isNotEmpty ?? false;

  void login(String username) {
    loadingState.state = true;
    Timer(const Duration(seconds: 2), () {
      loadingState.state = false;
      this.username = username;
      notifyListeners();
    });
  }

  void logout() {
    username = null;
    notifyListeners();
  }
}

final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  final loadingState = ref.read(loadingProvider.notifier);
  return AuthNotifier(loadingState);
});
