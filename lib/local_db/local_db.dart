import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class AuthTokenStorage {
  static const String USER = "PREF_KEY_USER";
  static const String UID = "UID";
  static const String ROLE = "ROLE";
  static const String KYCSTATUS = "KYCSTATUS";
  static const String PHONENO = "PHONE";
  static const String DefaultAddress = "ADDRESS";

  Future<Box> openHiveBox(String boxName) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  void mSetUserRole(var role) async {
    var box = await openHiveBox(USER);
    box.put(ROLE, role);
  }

  void mSetAddress(var address) async {
    var box = await openHiveBox(DefaultAddress);
    box.put(DefaultAddress, address);
  }

  void mSetKYCSTATUS(var status) async {
    var box = await openHiveBox(USER);
    box.put(KYCSTATUS, status);
  }

  void mSetUID(var uid) async {
    var box = await openHiveBox(USER);
    box.put(UID, uid);
  }

  void mSetPhoneNo(var mobileNo) async {
    var box = await openHiveBox(PHONENO);
    box.put(PHONENO, mobileNo);
  }

  Future<String?> mGetKYCSTATUS() async {
    var box = await openHiveBox(USER);
    return box.get(KYCSTATUS) as String?;
  }

  Future<String?> mGetDefaultAddress() async {
    var box = await openHiveBox(DefaultAddress);
    return box.get(DefaultAddress) as String?;
  }

  Future<String?> mGetUserRole() async {
    var box = await openHiveBox(USER);
    return box.get(ROLE) as String?;
  }

  Future<String?> mGetUid() async {
    var box = await openHiveBox(USER);
    return box.get(UID) as String?;
  }

  Future<String?> mGetPhoneNo() async {
    var box = await openHiveBox(PHONENO);
    return box.get(PHONENO) as String?;
  }

  void deleteUid() async {
    var box = await openHiveBox(USER);
    box.delete(UID);
  }

  void deletePhoneNo() async {
    var box = await openHiveBox(USER);
    box.delete(PHONENO);
  }

  void deleteROLE() async {
    var box = await openHiveBox(USER);
    box.delete(ROLE);
  }

  void deleteAddress() async {
    var box = await openHiveBox(USER);
    box.delete(DefaultAddress);
  }
}

class AuthTokenStorageImpl with AuthTokenStorage {}
