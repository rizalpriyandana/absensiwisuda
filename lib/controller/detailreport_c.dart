import 'package:absensiwisuda/model/dashboard_m.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailReportController extends GetxController {
  bool vis = false;
  String tpmhs = 'M';
  String tportu = 'O';
  String tptamu = 'T';
  String jenjang = "";
  String jenjangku = "";
  String prodi = "";
  RxInt totalterdaftar = RxInt(0);
  RxInt totalwisuda = RxInt(0);
  RxInt totalhadir = RxInt(0);
  RxInt total = RxInt(0);
  RxList<Prodi> listprodi = <Prodi>[].obs;

  getprodi(id_petugas) async {
    final Map<String, dynamic> dataBody = {
      GetProdiiModel.idpetugas: id_petugas,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/wisuda/dashboard/stats_by_study_program"),
        body: dataBody);
    if (response.statusCode == 200) {
      var dataprodi = jsonDecode(response.body);
      if (dataprodi['error'] == true) {
        Get.snackbar("Hi", "data tidak ada");
      } else {
        var result = Prodi.fromJson(dataprodi);
        jenjang = result.data[0].jenjang;
        prodi = result.data[1].prodi;
        totalterdaftar.value = int.parse(result.data[2].totalTerdaftar);
        totalhadir.value = int.parse(result.data[0].totalTerdaftar);
        total.value = result.total;
      }
    } else {
      return null;
    }
  }

  getjenjang(id_petugas) async {
    final Map<String, dynamic> dataBody = {
      GetProdiiModel.idpetugas: id_petugas,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/wisuda/dashboard/stats_by_level"),
        body: dataBody);
    if (response.statusCode == 200) {
      var dataprodi = jsonDecode(response.body);
      if (dataprodi['error'] == true) {
        Get.snackbar("Hi", "data tidak ada");
      } else {
        var result = Jenjang.fromJson(dataprodi);
        jenjangku = result.data[0].jenjang;
        totalwisuda.value = int.parse(result.data[1].totalWisuda);
      }
    } else {
      return null;
    }
  }
}
