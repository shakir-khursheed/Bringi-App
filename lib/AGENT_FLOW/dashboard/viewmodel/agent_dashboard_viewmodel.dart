import 'dart:io';

import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../navigator/agent_dashboard_navigator.dart';
import '../repo/agent_repo.dart';

User? user = FirebaseAuth.instance.currentUser;

class AgentDashboardViewModel
    extends BaseViewModel<AgentDashboardNavigator, AgentDashboardRepo> {
  bool loading = false;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> vieworders() {
    loading = true;
    notifyListeners();
    try {
      return _db
          .collection('Orders')
          .where('AssignedTo', isEqualTo: user!.phoneNumber)
          .snapshots();
    } on SocketException catch (e) {
      // Handle socket exception
      return Stream.error(e);
    } catch (e) {
      // Handle other exceptions
      getNavigator().showMessage("$e", color: Colors.red[900]);
      return Stream.empty();
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
