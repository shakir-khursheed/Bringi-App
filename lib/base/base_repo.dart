import 'package:bringi_app/base/base_webApi.dart';
import 'package:bringi_app/local_db/local_db.dart';
import 'package:bringi_app/service_locator/service_locator.dart';
import 'package:flutter/foundation.dart';

abstract class BaseRepo<W extends BaseWebApi> {
  final W _webApi = serviceLocator<W>();
  AuthTokenStorage _authTokenStorage = AuthTokenStorageImpl();

  @protected
  W get webApi => _webApi;

  void setUid(String uid) {
    _authTokenStorage.mSetUID(uid);
  }

  void setKYCSTATUS(String status) {
    _authTokenStorage.mSetKYCSTATUS(status);
  }

  Future<String?> getUid() async {
    var response = await _authTokenStorage.mGetUid();
    return response;
  }

  Future<String?> getKYCSTATUS() async {
    var response = await _authTokenStorage.mGetKYCSTATUS();
    return response;
  }

  void setRole(String role) {
    _authTokenStorage.mSetUserRole(role);
  }

  Future<String?> getUserRole() async {
    var response = await _authTokenStorage.mGetUserRole();
    return response;
  }

  deleteSession() {
    _authTokenStorage.deleteROLE();
    _authTokenStorage.deleteUid();
  }
}
