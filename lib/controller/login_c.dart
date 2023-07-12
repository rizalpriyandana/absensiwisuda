import 'dart:convert';
import 'dart:io';

import 'package:absensiwisuda/model/login_m.dart';
import 'package:absensiwisuda/routes/route_name.dart';
import 'package:absensiwisuda/ui/pages/bottomnavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isVisible = true.obs;
  final box = GetStorage().obs;
  late TextEditingController uc = TextEditingController();
  late TextEditingController pc = TextEditingController();
  var isLoading = false.obs;

  login(username, password) async {
    isLoading.value == true;
    final Map<String, dynamic> dataBody = {
      LoginModel.username: username,
      LoginModel.password: password,
    };
    try {
      var response =
          await http.post(Uri.parse(LoginModel.urlApi), body: dataBody);
      if (response.statusCode == 200) {
        var user = jsonDecode(response.body);
        if (user['error'] == true) {
          isLoading.value == false;
          Get.snackbar("Hi", "Terjadi Kesalahan");
        } else {
          box.value.write("dataUser", {
            "id_petugas": user['data']['id_petugas'],
            "periode": user['data']['periode'],
            "keterangan": user['data']['keterangan']
          });
          isLoading.value = false;
          Get.offNamed(RoutName.dashboard);
          Get.snackbar("Hi", "Berhasil Login");
          return user;
        }
      } else {
        Get.snackbar("Hi", "Koneksi Gagal");
      }
    } on SocketException catch (_) {
      Get.defaultDialog(middleText: "Cek Koneksi Anda");
    }
  }

  logout(id_petugas) async {
    final Map<String, dynamic> dataBody = {LoginModel.idpetugas: id_petugas};
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/wisuda/login/log_out"),
        body: dataBody);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      if (user['error'] == true) {
        isLoading.value == false;
        Get.snackbar("Hi", "Terjadi Kesalahan");
      } else {
        await box.value.remove("dataUser");
        uc.clear();
        pc.clear();
        Get.offAllNamed(RoutName.login);
        Get.snackbar("Hi", "Berhasil Logout");
        return user;
      }
    } else {
      Get.snackbar("Hi", "Koneksi Gagal");
    }
  }
}
