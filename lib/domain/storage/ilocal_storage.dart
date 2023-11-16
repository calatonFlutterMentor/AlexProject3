import '../user/iuser.dart';

abstract interface class ILocalStorage {
  Future<void> put(IUser user);

  Future<IUser> getUser();

  Future<void> remove();
}