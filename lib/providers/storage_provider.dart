import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final databaseProvider = Provider<DatabaseService>((ref) {
  final db = DatabaseService();
  db.initAuth();
  return db;
});

class DatabaseService {
  late Box<String?> authBox;

  String? get authSaved => authBox.isNotEmpty ? authBox.values.first : null;

  Future<void> initAuth() async {
    final box = await Hive.openBox<String>('auth');
    authBox = box;
  }

  Future<void> putAuth(String username) async {
    await authBox.put(0, username);
  }

  Future<void> deleteAuth() async {
    await authBox.delete(0);
  }
}
