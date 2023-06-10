import 'dart:io';

import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:bringi_app/signup_and_login/model/sign_up_usermodel.dart';
import 'package:bringi_app/signup_and_login/navigator/user_registration_navigator.dart';
import 'package:bringi_app/signup_and_login/repo/user_registration_repo.dart';

class UserRegistrationViewModel
    extends BaseViewModel<UserRegistrationNavigator, UserRegistrationRepo> {
  File? _documentProof1;
  File? _documentProof2;
  File? _documentProof3;
  UserModel? _userModel;

//getter & setters

  File? get getDocumentProof1 => _documentProof1;
  set setDocumentProof1(File? value) {
    _documentProof1 = value;
    notifyListeners();
  }

  File? get getDocumentProof2 => _documentProof2;
  set setDocumentProof2(File? value) {
    _documentProof2 = value;
    notifyListeners();
  }

  File? get getDocumentProof3 => _documentProof3;
  set setDocumentProof3(File? value) {
    _documentProof3 = value;
    notifyListeners();
  }

  Future<void> registerUser() async {
    try {
      await repository
          .registerUser(
            userModel: _userModel,
          )
          .whenComplete(() => {
                getNavigator().showMessage(
                  "User registrated successfully",
                ),
              });
    } on SocketException catch (e) {
      getNavigator().showMessage(e.message);
    } on FormatException catch (e) {
      getNavigator().showMessage(e.message);
    } catch (e) {
      getNavigator().showMessage("error registering user!");
    }
  }

//end
}
