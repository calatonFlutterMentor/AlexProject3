import '../../domain/user/iuser.dart';

class User implements IUser {
  @override
  final String email;

  @override
  final String password;

  User({required this.email, required this.password});
}
