import 'package:bringi_app/signup_and_login/webApi/login_webApi.dart';
import 'package:get_it/get_it.dart';

import '../signup_and_login/repo/login_repo.dart';
import '../signup_and_login/viewmodel/user_registration_viewmodel.dart';
import '../splash_screen/repo/splash_repo.dart';
import '../splash_screen/viewmodel/splash_viewmodel.dart';
import '../splash_screen/webApi/splash_webApi.dart';

final serviceLocator = GetIt.instance;
void setupServices() {
  // 1. SPLASH SCREEN

  serviceLocator
    ..registerLazySingleton<SplashWebApi>(() => SplashWebApiImpl())
    ..registerLazySingleton<SplashRepo>(() => SplashRepo())
    ..registerFactory<SplashviewModel>(() => SplashviewModel());

  // 2. LOGIN SCREEN

  serviceLocator
    ..registerLazySingleton<UserRegistrationWebApi>(
        () => UserRegistrationWebApiImpl())
    ..registerLazySingleton<UserRegistrationRepo>(() => UserRegistrationRepo())
    ..registerFactory<UserRegistrationViewModel>(
        () => UserRegistrationViewModel());
}
