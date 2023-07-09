import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../navigator/M-distributor_dashboard_navigator.dart';
import '../repo/M-distributor_repo.dart';

class MDistributorDashboardViewModel extends BaseViewModel<
    MDistributorDashboardNavigator, MDistributorDashboardRepo> {
  FirebaseFirestore _db = FirebaseFirestore.instance;


  
}
