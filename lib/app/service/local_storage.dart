import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/user.dart';
import '../../domain/storage/ilocal_storage.dart';
import '../../domain/user/iuser.dart';

class LocalStorage implements ILocalStorage {
  LocalStorage();

  static const String _emailKey = "email";
  static const String _passwordKey = "email";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> put(IUser user) async {
    final prefs = await _prefs;
    return Future.wait([
      prefs.setString(_emailKey, user.email),
      prefs.setString(_passwordKey, user.password),
    ]).then((value) => null);
  }

  @override
  Future<void> remove() async {
    final prefs = await _prefs;
    await prefs.remove(_emailKey);
    await prefs.remove(_passwordKey);
  }

  @override
  Future<IUser> getUser() async {
    final prefs = await _prefs;
    final email = prefs.getString(_emailKey);
    final password = prefs.getString(_passwordKey);
    assert(email != null && password != null);
    return User(
      email: email!,
      password: password!,
    );
  }
}
