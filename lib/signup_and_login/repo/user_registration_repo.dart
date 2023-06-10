import 'package:bringi_app/base/base_repo.dart';
import 'package:bringi_app/signup_and_login/model/sign_up_usermodel.dart';
import 'package:bringi_app/signup_and_login/webApi/user_registration_webApi.dart';

class UserRegistrationRepo extends BaseRepo<UserRegistrationWebApi> {
  Future<dynamic> registerUser({UserModel? userModel}) async {
    await webApi.registerUser(
      userModel: userModel,
      uid: getUid?.uid.toString(),
    );
  }
}
