import 'dart:io';

import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:bringi_app/signup_and_login/model/sign_up_usermodel.dart';
import 'package:bringi_app/signup_and_login/navigator/user_registration_navigator.dart';
import 'package:bringi_app/signup_and_login/repo/user_registration_repo.dart';

class UserRegistrationViewModel
    extends BaseViewModel<UserRegistrationNavigator, UserRegistrationRepo> {
  List<File> documentProofs = [];
  UserModel? _userModel;
  Map<String, dynamic> userCredentials = Map<String, dynamic>();

//getter & setters
  void addDocuments(value) {
    documentProofs.add(value);
    notifyListeners();
  }

  void removeDocument(index) {
    documentProofs.removeAt(index);
    notifyListeners();
  }

  void removeAllDocuments() {
    documentProofs.clear();
    notifyListeners();
  }

  void uploadDocumentProof() async {}

  Future<void> registerUser() async {
    UserModel(
      mobileNo: userCredentials['mobileNo'],
      shopName: userCredentials['shopName'],
      address: userCredentials['address'],
      docProof1Url: userCredentials['docProof1Url'],
      docProof2Url: userCredentials['docProof2Url'],
      docProof3Url: userCredentials['docProof3Url'],
      role: userCredentials['role'],
      createdAt: userCredentials['createdAt'],
    );
    showLoading = true;
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
    } finally {
      showLoading = false;
    }
  }

//end
}
