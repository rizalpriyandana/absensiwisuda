import 'package:absensiwisuda/controller/dashboard_c.dart';
import 'package:absensiwisuda/controller/login_c.dart';
import 'package:absensiwisuda/controller/scan_c.dart';
import 'package:absensiwisuda/controller/splash_c.dart';
import 'package:get/get.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(AuthController());
    Get.put(DashboardController());
    Get.put(QRController());
  }
  
}