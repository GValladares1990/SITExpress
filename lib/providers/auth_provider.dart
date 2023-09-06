import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitexpress/providers/loading_provider.dart';
import 'package:sitexpress/providers/storage_provider.dart';

final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  final database = ref.watch(databaseProvider);
  return AuthNotifier(ref, database);
});

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this.ref, this._db);

  final Ref ref;
  late final DatabaseService _db;

  String? get username => _db.authSaved;
  bool get isAuth => username?.isNotEmpty ?? false;

  StateController get loading => ref.read(loadingProvider.notifier);

  void login(String username) {
    loading.state = true;
    Timer(const Duration(seconds: 2), () {
      loading.state = false;
      _db.putAuth(username);
      notifyListeners();
    });
  }

  void logout() {
    _db.deleteAuth();
    notifyListeners();
  }
}
