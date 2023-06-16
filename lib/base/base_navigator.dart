import 'package:flutter/material.dart';

abstract class BaseNavigator {
  void showMessage(String message, {Color? color});
  void navigateToVerifyUserFlow();
  void pop();
  void showNoInternetPage();
}
