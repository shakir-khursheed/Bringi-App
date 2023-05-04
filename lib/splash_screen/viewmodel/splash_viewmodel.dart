import 'dart:async';

import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:bringi_app/splash_screen/navigator/splash_navigator.dart';
import 'package:bringi_app/splash_screen/repo/splash_repo.dart';

class SplashviewModel extends BaseViewModel<SplashNavigator, SplashRepo> {
  void checkAppSession() {
    Timer(const Duration(seconds: 1), () {
      getNavigator().navigateToLogin();
    });
  }
}
