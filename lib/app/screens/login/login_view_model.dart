import '../../../data/repository/iuser_repo.dart';
import '../../common/base_change_notifiere.dart';

class LoginViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;

  LoginViewModel({required IUserRepository userRepository})
      : _userRepository = userRepository;

  Future<void> onLogInButtonPressed(String email, String password) async {
    startLoading();
    await _userRepository.singIn(email, password);
    stopLoading();
  }
}
