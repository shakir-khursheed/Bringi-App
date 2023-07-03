import 'package:bringi_app/DISTRIBUTOR_FLOW/dashboard/services/distributor_dashboard_webApi.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/services/retailer_dashboard_webApi.dart';
import 'package:bringi_app/signup_and_login/webApi/user_registration_webApi.dart';
import 'package:get_it/get_it.dart';

import '../AGENT_FLOW/dashboard/repo/agent_repo.dart';
import '../AGENT_FLOW/dashboard/services/agent_dashboard_webApi.dart';
import '../AGENT_FLOW/dashboard/viewmodel/agent_dashboard_viewmodel.dart';
import '../DISTRIBUTOR_FLOW/dashboard/repo/distributor_repo.dart';
import '../DISTRIBUTOR_FLOW/dashboard/viewmodel/distributor_dashboard_viewmodel.dart';
import '../M_DISTRIBUTOR_FLOW/dashboard/repo/M-distributor_repo.dart';
import '../M_DISTRIBUTOR_FLOW/dashboard/services/M-distributor_dashboard_webApi.dart';
import '../M_DISTRIBUTOR_FLOW/dashboard/viewmodel/M-distributor_dashboard_viewmodel.dart';
import '../RETAILER_FLOW/dashboard/repo/retailer_repo.dart';
import '../RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
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

  //4. DISTRIBUTOR

  serviceLocator
    ..registerLazySingleton<DistributorDashboardWebApi>(
        () => DistributorDashboardWebApiImpl())
    ..registerLazySingleton<DistributorDashboardRepo>(
        () => DistributorDashboardRepo())
    ..registerFactory<DistributorDashboardViewModel>(
        () => DistributorDashboardViewModel());

  //5. MDISTRIBUTOR

  serviceLocator
    ..registerLazySingleton<MDistributorDashboardWebApi>(
        () => MDistributorDashboardWebApiImpl())
    ..registerLazySingleton<MDistributorDashboardRepo>(
        () => MDistributorDashboardRepo())
    ..registerFactory<MDistributorDashboardViewModel>(
        () => MDistributorDashboardViewModel());

  //6. AGENT

  serviceLocator
    ..registerLazySingleton<AgentDashboardWebApi>(
        () => AgentDashboardWebApiImpl())
    ..registerLazySingleton<AgentDashboardRepo>(() => AgentDashboardRepo())
    ..registerFactory<AgentDashboardViewModel>(() => AgentDashboardViewModel());
}
