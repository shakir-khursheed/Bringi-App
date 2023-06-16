import 'package:bringi_app/base/base_navigator.dart';

abstract class UserRegistrationNavigator extends BaseNavigator {
  void onRefferelCodeMatch();
  void navigateToUserRegistrationFlow();
  void navigateToDashboard();
}
