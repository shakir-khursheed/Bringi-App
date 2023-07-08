import 'dart:io';

import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/repo/retailer_repo.dart';
import 'package:bringi_app/Response_model/product_list_response.dart';
import 'package:bringi_app/Response_model/saved_address_response.dart';
import 'package:bringi_app/base/base_viewmodel.dart';

class RetailerDashboardViewModel
    extends BaseViewModel<RetailerDashboardNavigator, RetailerDashboardRepo> {
  List<ListOfProduct> productList = List.empty(growable: true);
  ListOfProduct? product;
  static List<Map<String, dynamic>> retailerAddress = [];
  List<Address> savedAddresses = List.empty(growable: true);

  void getProducts() async {
    showLoading = true;
    try {
      var response = await repository.getProducts();
      productList = response.listOfProducts;
      notifyListeners();
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }

  void getProductDetails(String productId) async {
    showLoading = true;
    try {
      var response = await repository.getProducts();
      product = response.listOfProducts.firstWhere(
        (element) => element.userid == productId,
      );
      notifyListeners();
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }

  void getSavedAddress() async {
    showLoading = true;
    try {
      var response = await repository.getSavedAddress();
      savedAddresses = response.addresses;
      notifyListeners();
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }

  void saveAddress({
    String? address,
    String? city,
    String? pincode,
  }) async {
    showLoading = true;
    retailerAddress.add({
      "address": address,
      "city": city,
      "pincode": pincode,
    });
    try {
      await repository.saveAddress(
        address: retailerAddress,
      );
      getNavigator().onAddressSavedSucessfully();
      getNavigator().showMessage("Address saved successfully");
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }
}
