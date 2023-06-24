import 'package:bringi_app/RETAILER_%20APP_FLOW/dashboard/services/retailer_dashboard_webApi.dart';
import 'package:bringi_app/signup_and_login/webApi/user_registration_webApi.dart';
import 'package:get_it/get_it.dart';

import '../RETAILER_ APP_FLOW/dashboard/repo/retailer_repo.dart';
import '../RETAILER_ APP_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import '../signup_and_login/repo/user_registration_repo.dart';
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

  //3. RETAILER DASHBOARD

  serviceLocator
    ..registerLazySingleton<RetailerDashboardWebApi>(
        () => RetailerDashboardWebApiImpl())
    ..registerLazySingleton<RetailerDashboardRepo>(
        () => RetailerDashboardRepo())
    ..registerFactory<RetailerDashboardViewModel>(
        () => RetailerDashboardViewModel());
}
