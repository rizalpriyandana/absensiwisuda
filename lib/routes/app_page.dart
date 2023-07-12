import 'package:absensiwisuda/routes/route_name.dart';
import 'package:absensiwisuda/ui/pages/bottomnavigation.dart';
import 'package:absensiwisuda/ui/pages/login.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RoutName.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RoutName.dashboard,
      page: () => BottomNavigationBarExample(),
    ),
  ];
}
