// ignore_for_file: use_key_in_widget_constructors

import 'package:absensiwisuda/controller/login_c.dart';
import 'package:absensiwisuda/ui/pages/bottomnavigation.dart';
import 'package:absensiwisuda/ui/theme/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 5.h,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70.sp),
                  child: Container(
                    padding: EdgeInsets.all(0.sp),
                    height: 80.sp,
                    width: 80.sp,
                    child: Image.asset('assets/icons/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Selamat Datang\ndi e-absensi wisuda",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: DataColors.black),
                  textAlign: TextAlign.center,
                ),
                // SizedBox(height: 5.sp,),
                Text(
                  "Petugas Wisuda",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: DataColors.black),
                ),

                // form nim
                TextFormField(
                  autocorrect: false,
                  controller: c.uc,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14.0.sp),
                    isDense: true,
                    hintText: 'User ID',
                    hintStyle: TextStyle(
                      color: Colors.grey, // <-- Change this
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: DataColors.semigrey, width: 1.0),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),
                // end form nim
                SizedBox(
                  height: 25.sp,
                ),

                // form password

                TextFormField(
                  autocorrect: false,
                  obscureText: c.isVisible.value,
                  controller: c.pc,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14.0),
                    isDense: true,
                    hintText: 'Kata Sandi',
                    hintStyle: TextStyle(
                      color: Colors.grey, // <-- Change this
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    suffixIcon: IconButton(
                        color: Colors.grey,
                        splashRadius: 1,
                        icon: Icon(c.isVisible.value == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          c.isVisible.toggle();
                        }),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: DataColors.semigrey, width: 1.0),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),

                //end form password

                SizedBox(
                  height: 10.sp,
                ),
                // error message
                // Visibility(
                //   visible: c.errorMsg.value,
                //   child: const Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       "*Username atau password salah ",
                //       style: TextStyle(color: Colors.red),
                //     ),
                //   ),
                // ),
                // end forgot password

                // Forgont password

                // end forgot password

                SizedBox(
                  height: 40.sp,
                ),

                // button login
                SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () => c.login(c.uc.text, c.pc.text),
                    style: ElevatedButton.styleFrom(
                      primary: DataColors.primary,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(14.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: c.isLoading.isTrue
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                    ),
                  ),
                )
                // end button login
              ],
            ),
          ),
        ),
      ),
    ));
  }
  // return Scaffold(
  //   resizeToAvoidBottomInset: false,
  //   body: SafeArea(
  //     child: Container(
  //       padding: EdgeInsets.all(0.sp),
  //       child: Center(
  //           child: Obx(
  //         () => Column(
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.only(top: 70.sp),
  //               child: Container(
  //                 padding: EdgeInsets.all(0.sp),
  //                 height: 80.sp,
  //                 width: 80.sp,
  //                 child: Image.asset('assets/icons/logo.png'),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 10.sp,
  //             ),
  //             Text(
  //               "Selamat Datang\ndi e-absensi wisuda",
  //               style: TextStyle(
  //                   fontSize: 16.sp,
  //                   fontWeight: FontWeight.bold,
  //                   color: DataColors.black),
  //               textAlign: TextAlign.center,
  //             ),
  //             // SizedBox(height: 5.sp,),
  //             Text(
  //               "Petugas Wisuda",
  //               style: TextStyle(
  //                   fontSize: 10.sp,
  //                   fontWeight: FontWeight.w500,
  //                   color: DataColors.black),
  //             ),
  //             Padding(
  //               padding:
  //                   EdgeInsets.only(top: 30.sp, right: 10.sp, left: 10.sp),
  //               child: SizedBox(
  //                 // height: 60.sp,
  //                 width: 260.sp,
  //                 child: TextFormField(
  //                   controller: c.uc,
  //                   decoration: InputDecoration(
  //                       prefixIcon: Padding(
  //                         padding: EdgeInsets.all(10.sp),
  //                         child: Image.asset(
  //                           'assets/icons/user.png',
  //                           height: 20.sp,
  //                           width: 20.sp,
  //                         ),
  //                       ),
  //                       hintText: "User ID",
  //                       hintStyle: TextStyle(
  //                         color: Colors.black38,
  //                         fontSize: 10.sp,
  //                         fontWeight: FontWeight.w100,
  //                       ),
  //                       filled: true,
  //                       fillColor: DataColors.neutral200,
  //                       enabledBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(5.sp),
  //                           borderSide:
  //                               BorderSide(color: DataColors.neutral200)),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5.sp),
  //                         borderSide:
  //                             BorderSide(color: DataColors.primary700),
  //                       )),
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding:
  //                   EdgeInsets.only(top: 10.sp, right: 10.sp, left: 10.sp),
  //               child: SizedBox(
  //                 // height: 50.sp,
  //                 width: 260.sp,
  //                 child: TextFormField(
  //                   obscureText: c.isVisible.value,
  //                   controller: c.pc,
  //                   decoration: InputDecoration(
  //                       prefixIcon: Padding(
  //                         padding: EdgeInsets.all(10.sp),
  //                         child: Image.asset(
  //                           'assets/icons/lock.png',
  //                           height: 20.sp,
  //                           width: 20.sp,
  //                         ),
  //                       ),
  //                       hintText: "Password",
  //                       hintStyle: TextStyle(
  //                         color: Colors.black38,
  //                         fontSize: 10.sp,
  //                         fontWeight: FontWeight.w100,
  //                       ),
  //                       suffixIcon: IconButton(
  //                         color: DataColors.black,
  //                         splashRadius: 1,
  //                         icon: Icon(c.isVisible.value == false
  //                             ? Icons.visibility_outlined
  //                             : Icons.visibility_off_outlined),
  //                         onPressed: () {
  //                           c.isVisible.toggle();
  //                         },
  //                       ),
  //                       filled: true,
  //                       fillColor: DataColors.neutral200,
  //                       enabledBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(5.sp),
  //                           borderSide:
  //                               BorderSide(color: DataColors.neutral200)),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5.sp),
  //                         borderSide:
  //                             BorderSide(color: DataColors.primary700),
  //                       )),
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding:
  //                   EdgeInsets.only(top: 35.sp, right: 10.sp, left: 10.sp),
  //               child: SizedBox(
  //                 width: 260.sp,
  //                 height: 45.sp,
  //                 child: ElevatedButton(
  //                   onPressed: () {
  //                     String userid = c.uc.text.trim();
  //                     String password = c.pc.text.trim();
  //                     if (userid.isNotEmpty && password.isNotEmpty) {
  //                       c.login(c.uc.text, c.pc.text);
  //                     } else if (userid.isEmpty && password.isNotEmpty) {
  //                       Get.snackbar("Hi", "Silahkan Isi User ID");
  //                     } else if (userid.isNotEmpty && password.isEmpty) {
  //                       Get.snackbar("Hi", "Silahkan Isi Password");
  //                     } else {
  //                       Get.snackbar("Galat", "Silahkan Lengkapi Formulir");
  //                     }
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: DataColors.primary,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(10.sp),
  //                     ),
  //                   ),
  //                   child: Padding(
  //                     padding: EdgeInsets.all(5.sp),
  //                     child: c.isLoading.isTrue
  //                     ?
  //                     SizedBox(
  //                       height: 15.sp,
  //                       width: 15.sp,
  //                       child: CircularProgressIndicator(
  //                         strokeWidth: 3.sp,
  //                         valueColor: AlwaysStoppedAnimation<Color>(DataColors.white),
  //                       ),
  //                     )
  //                     :
  //                     Text(
  //                       'Login',
  //                       style: TextStyle(
  //                         fontSize: 14.sp,
  //                         fontWeight: FontWeight.w800,
  //                       ),
  //                     )
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       )),
  //     ),
  //   ),
  // );
}
