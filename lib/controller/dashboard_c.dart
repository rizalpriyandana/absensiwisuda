// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names

import 'package:absensiwisuda/model/absensiT_m.dart';
import 'package:absensiwisuda/model/absensi_m.dart';
import 'package:absensiwisuda/model/dashboard_m.dart';
import 'package:absensiwisuda/model/login_m.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  List<String> id = [];
  RxInt totalAbsensimhs = RxInt(0);
  RxInt totalAbsensiortu = RxInt(0);
  RxInt totalAbsensitamu = RxInt(0);
  RxInt totalPesertamhs = RxInt(0);
  RxInt totalPesertaortu = RxInt(0);
  RxInt totalPesertatamu = RxInt(0);
  RxInt totalPetugas = RxInt(0);
  int totalpeserta = 0;
  RxBool vis = true.obs;
  Absensi? globalAbsensi;

  String prodi = "";

  statsabsensi(idpetugas) async {
    final Map<String, dynamic> dataBody = {
      StatAbsensiModel.idpetugas: idpetugas,
    };
    var response = await http.post(
        Uri.parse('https://siakad.strada.ac.id/wisuda/dashboard/stats'),
        body: dataBody);
    if (response.statusCode == 200) {
      var datastat = jsonDecode(response.body);
      if (datastat['error'] == true) {
        return null;
      } else {
        StatAbsensi sa = StatAbsensi.fromJson(datastat);
        totalAbsensimhs.value = int.parse(sa.data[0].totalAbsensi);
        totalAbsensiortu.value = int.parse(sa.data[1].totalAbsensi);
        totalAbsensitamu.value = int.parse(sa.data[2].totalAbsensi);
        totalPesertamhs.value = int.parse(sa.data[0].totalPeserta);
        totalPesertaortu.value = int.parse(sa.data[1].totalPeserta);
        totalPesertatamu.value = int.parse(sa.data[2].totalPeserta);
        totalpeserta = int.parse(sa.data[0].totalPeserta) +
            int.parse(sa.data[1].totalPeserta) +
            int.parse(sa.data[2].totalPeserta);
      }
    } else {}
  }

  profile(id_petugas) async {
    final Map<String, dynamic> dataBody = {
      LoginModel.idpetugas: id_petugas,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/wisuda/dashboard/profile"),
        body: dataBody);
    if (response.statusCode == 200) {
      var dataku = jsonDecode(response.body);
      if (dataku['error'] == true) {
        return null;
      } else {
        totalPetugas.value = int.parse(dataku['data']['total_petugas']);
      }
    } else {
      return Get.snackbar("Hi", "Terjadi Kesalahan");
    }
  }

  absensipeserta(id_petugas, jenis, kode) async {
    final Map<String, dynamic> dataBody = {
      AbsensiModel.idpetugas: id_petugas,
      AbsensiModel.jenis: jenis,
      AbsensiModel.kode: kode
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/wisuda/scan/scan_peserta"),
        body: dataBody);
    if (response.statusCode == 200) {
      var dataku = jsonDecode(response.body);
      if (dataku['msg'] != "Peserta sudah melakukan absensi" && jenis == "M") {
        Absensi absensi = Absensi.fromJson(dataku);
        prodi = absensi.data.fakultas;
        // totalAbsensimhs.value++;
        List<String> result = [
          absensi.data.name,
          absensi.data.nim,
          absensi.data.prodi,
          absensi.data.jenjang,
          absensi.data.namaOrtu,
          absensi.data.statusOrtu,
          absensi.data.photo,
          jenis
        ];
        Get.back(result: result);
        Get.snackbar(absensi.msg, "${absensi.data.name} - ${absensi.data.nim}");
      } else if (dataku['msg'] != "Peserta sudah melakukan absensi" &&
          jenis == "O") {
        Absensi ao = Absensi.fromJson(dataku);
        // totalAbsensiortu.value++;
        List<String> result = [
          ao.data.name,
          ao.data.nim,
          ao.data.prodi,
          ao.data.jenjang,
          ao.data.namaOrtu,
          ao.data.statusOrtu,
          ao.data.photo,
          jenis
        ];
        Get.back(result: result);
        Get.snackbar(
            ao.msg, "${ao.data.namaOrtu} Ortu dari Mahasiswa ${ao.data.name}");
      } else if (dataku['msg'] != "Peserta sudah melakukan absensi" &&
          jenis == "T") {
        AbsensiTamu at = AbsensiTamu.fromJson(dataku);
        // totalAbsensitamu.value++;
        List<String> result = [at.data.namaPeserta, jenis];
        Get.back(result: result);
        Get.snackbar(at.msg, "Nama Tamu : ${at.data.namaPeserta}");
      } else if (dataku['msg'] == "Peserta sudah melakukan absensi" &&
          jenis == "M") {
        SudahAbsensi sa = SudahAbsensi.fromJson(dataku);
        Get.back();
        Get.snackbar("E-Absensi", sa.msg);
      } else if (dataku['msg'] == "Peserta sudah melakukan absensi" &&
          jenis == "O") {
        SudahAbsensi sa = SudahAbsensi.fromJson(dataku);
        Get.back();
        Get.snackbar("E-Absensi", sa.msg);
      } else if (dataku['msg'] == "Peserta sudah melakukan absensi" &&
          jenis == "T") {
        SudahAbsensi sa = SudahAbsensi.fromJson(dataku);
        Get.back();
        Get.snackbar("E-Absensi", sa.msg);
      }
    } else {
      Get.snackbar("E-Absensi", "Terjadi Kesalahan saat Absensi");
    }
  }
}
