import 'package:bringi_app/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

import 'base_repo.dart';

abstract class BaseViewModel<N, R extends BaseRepo> extends ChangeNotifier {
  bool _showLoading = false;

  R repository = serviceLocator<R>();

  bool get showLoading => _showLoading;

  late N _navigator;

  N getNavigator() => _navigator;

  void setNavigator(N navigator) {
    _navigator = navigator;
  }

  set showLoading(bool value) {
    _showLoading = value;
    notifyListeners();
  }
}
