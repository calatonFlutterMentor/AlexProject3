import 'package:calaton_third_project/domain/product/iproduct.dart';

import '../../../data/repository/iuser_repo.dart';
import '../../../data/repository/product_repo/iproduct_repo.dart';
import '../../../domain/user/iuser.dart';
import '../../common/base_change_notifiere.dart';

class HomeViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final IProductRepository _iProductRepository;

  HomeViewModel(
      {required IUserRepository userRepository,
      required IProductRepository iProductRepository})
      : _userRepository = userRepository,
        _iProductRepository = iProductRepository;

  Future<void> onLogOutButtonPressed() async {
    await _userRepository.logOut();
    notifyListeners();
  }

  Future<IUser> getUser() async {
    return await _userRepository.getUser();
  }
  Future<List<IProduct>> getAllProduct() async {
    final List<IProduct> productList = await _iProductRepository.getAllProduct();
    print(productList.length);
    return await _iProductRepository.getAllProduct();
  }
}
