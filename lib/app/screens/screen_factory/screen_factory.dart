import 'package:calaton_third_project/app/service/local_storage.dart';
import 'package:calaton_third_project/app/service/product_service/product_servise.dart';
import 'package:calaton_third_project/data/repository/product_repo/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repository/user_repo.dart';
import '../login/login_screen.dart';
import '../login/login_view_model.dart';
import '../home/home_screen.dart';
import '../home/home_view_model.dart';

class ScreenFactory {
  static Widget buildInitialScreen() {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        userRepository: UserRepository(userService: LocalStorage()), iProductRepository: ProductRepository(productService: ProductService()),

      ),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return FutureBuilder(
            future: model.getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userEmail = snapshot.data?.email;
                final userPassword = snapshot.data?.password;
                if (userEmail != null && userPassword != null) {
                  return HomeScreen(viewModel: model);
                } else {
                  return ScreenFactory.buildLogInScreen();
                }
              } else {
                return ScreenFactory.buildLogInScreen();
              }
            },
          );
        },
      ),
    );
  }

  static Widget buildLogInScreen() {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(
          userRepository: UserRepository(userService: LocalStorage())),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => LoginScreen(viewModel: model),
      ),
    );
  }
}
