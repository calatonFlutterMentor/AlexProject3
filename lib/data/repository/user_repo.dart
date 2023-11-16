import '../../domain/storage/ilocal_storage.dart';
import '../../domain/user/iuser.dart';
import '../model/user.dart';
import 'iuser_repo.dart';

class UserRepository implements IUserRepository {

  UserRepository({required ILocalStorage userService})
      : _userService = userService;
  final ILocalStorage _userService;

  @override
  Future<void> singIn(String email, String password) {
    return _userService.put(User(email: email, password: password));
  }

  @override
  Future<void> logOut() {
    return _userService.remove();
  }

  @override
  Future<IUser> getUser() {
    return _userService.getUser();
  }
}
