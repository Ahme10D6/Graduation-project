import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {
  void logOut(BuildContext ctx) {
    DI.getItInstance<AppCache>().setIsUserLoggedIn(false);
    ctx.pushReplacementNamed(RoutesName.splash);
  }

  void onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  @override
  void start() {}
}