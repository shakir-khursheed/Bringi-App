import 'package:bringi_app/base/base_repo.dart';
import 'package:bringi_app/signup_and_login/model/usermodel.dart';
import 'package:bringi_app/signup_and_login/webApi/user_registration_webApi.dart';

import '../model/refferel_code_model.dart';

class UserRegistrationRepo extends BaseRepo<UserRegistrationWebApi> {
  Future<RefferalCodeModel> checkRefferelCode() async {
    print(
      await getPhoneNo(),
    );
    return await webApi.checkRefferelCode(
      await getPhoneNo(),
    );
  }

  Future<void> verfyUser({
    String? mobile,
    Function? onVerificationCompleted,
    Function? onCodeSent,
    Function? codeAutoRetrivalTimeOut,
    Function? onVerificationFailed,
  }) async {
    await webApi.verfyUser(
      mobile: mobile,
      onVerificationCompleted: (credentails) =>
          onVerificationCompleted!(credentails),
      onVerificationFailed: (e) => onVerificationFailed!(e),
      onCodeSent: (String verificationId, int? resendToken) =>
          onCodeSent!(verificationId, resendToken),
      codeAutoRetrivalTimeOut: (String verificationId) =>
          codeAutoRetrivalTimeOut!(verificationId),
    );
  }

  Future<void> registerUser(
      {String? mobileNo,
      String? name,
      String? address,
      List<String>? downloadUrl,
      String? createdAt,
      String? role}) async {
    return await webApi.registerUser(
      uid: await getUid(),
      mobileNo: mobileNo,
      name: name,
      address: address,
      downloadUrl: downloadUrl,
      createdAt: createdAt,
      role: role,
    );
  }

  Future<UserModel> checkKYCstatus() async {
    return webApi.checkKYCstatus(
      uid: await getUid(),
    );
  }

  Future<UserModel> checkDoesUserExists() async {
    return webApi.checkDoesUserExists(
      uid: await getUid(),
    );
  }
}
