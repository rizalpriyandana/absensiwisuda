import 'package:absensiwisuda/bindings/binding.dart';
import 'package:absensiwisuda/routes/app_page.dart';
import 'package:absensiwisuda/ui/pages/login.dart';
import 'package:absensiwisuda/ui/pages/splashscreen.dart';
import 'package:absensiwisuda/ui/pages/test.dart';
import 'package:absensiwisuda/ui/pages/wisuda.dart';
import 'package:absensiwisuda/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  GlobalBinding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
          theme: ThemeData(
              fontFamily: 'Poppins', scaffoldBackgroundColor: DataColors.white),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          getPages: AppPage.pages,
        );
      },
    );
  }
}
