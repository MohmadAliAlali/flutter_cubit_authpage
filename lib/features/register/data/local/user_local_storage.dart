import 'package:hive/hive.dart';
import 'package:task1_cubit/core/storage/boxes.dart';
import 'package:task1_cubit/core/storage/hive_manager.dart';

class UserLocalStorage {

  final Box _box = HiveManager.getBox(HiveBoxes.userBox);

  Future<void> saveUser({
    required String id,
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await _box.put('user', {
      'id': id,
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
    });
  }

  Map<String, dynamic>? getUser() {
    final data = _box.get('user');
    if (data == null) return null;
    return Map<String, dynamic>.from(data);
  }

  Future<void> clearUser() async {
    await _box.delete('user');
  }
}
