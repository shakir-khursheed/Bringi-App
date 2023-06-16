import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class AuthTokenStorage {
  static const String USER = "PREF_KEY_USER";
  static const String UID = "UID";
  static const String ROLE = "ROLE";

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

  void mSetUID(var uid) async {
    var box = await openHiveBox(USER);
    box.put(UID, uid);
  }

  Future<String?> mGetUserRole() async {
    var box = await openHiveBox(USER);
    return box.get(ROLE) as String?;
  }

  Future<String?> mGetUid() async {
    var box = await openHiveBox(USER);
    return box.get(UID) as String?;
  }

  void deleteUid() async {
    var box = await openHiveBox(USER);
    box.delete(UID);
  }

  void deleteROLE() async {
    var box = await openHiveBox(USER);
    box.delete(ROLE);
  }
}

class AuthTokenStorageImpl with AuthTokenStorage {}
