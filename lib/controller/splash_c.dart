import 'package:absensiwisuda/routes/route_name.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  // final c = Get.find<AuthController>();
  final int timerSplash = 3;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: timerSplash), () async {
      Get.offNamed(RoutName.login);
    //   final box = GetStorage();
    //   box.read('isViewed');

    //   if (box.read('isViewed') == true) {
    //     // if onboard is viewed
    //     final dataUser = box.read('dataUser');

    //     // check if user data is not null
    //     if (dataUser != null) {
    //       // user data has been previously saved, go to dashboard
    //       if (c.login(dataUser['username'], dataUser['password']) != "salah") {
    //         c.login(dataUser['username'], dataUser['password']);
    //       } else {
    //         Get.offAllNamed(RoutName.login);
    //       }
    //     } else {
    //       Get.offAllNamed(RoutName.login);
    //     }
    //   } else {
    //     Get.offAllNamed(RoutName.onboard);
    //   }
    // }
    }
    );
  }
}
