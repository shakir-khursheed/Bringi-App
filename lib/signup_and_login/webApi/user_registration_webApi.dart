import 'package:bringi_app/base/base_webApi.dart';
import 'package:bringi_app/signup_and_login/model/sign_up_usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRegistrationWebApi extends BaseWebApi {
  Future<dynamic> registerUser({
    UserModel? userModel,
    String? uid,
  });
}

class UserRegistrationWebApiImpl implements UserRegistrationWebApi {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  Future<dynamic> registerUser({UserModel? userModel, String? uid}) async {
    var response =
        await _db.collection("Users").doc(uid).set(userModel!.toJson());
    return response;
  }
}
