import 'package:bringi_app/base/base_webApi.dart';
import 'package:bringi_app/service_locator/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class BaseRepo<W extends BaseWebApi> {
  final W _webApi = serviceLocator<W>();
  User? _userId = FirebaseAuth.instance.currentUser;

  @protected
  W get webApi => _webApi;

  User? get getUid => _userId;
}
