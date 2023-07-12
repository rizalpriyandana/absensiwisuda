// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';
import 'dart:developer';

import 'package:absensiwisuda/controller/dashboard_c.dart';
import 'package:absensiwisuda/controller/scan_c.dart';
import 'package:absensiwisuda/model/absensi_m.dart';
import 'package:absensiwisuda/ui/pages/scanner.dart';
import 'package:absensiwisuda/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class QrCodeScreenWidget extends StatefulWidget {
  @override
  State<QrCodeScreenWidget> createState() => _QrCodeScreenWidgetState();
}

class _QrCodeScreenWidgetState extends State<QrCodeScreenWidget> {
  QRController cqr = Get.find<QRController>();
  DashboardController dc = Get.find<DashboardController>();
  final box = GetStorage();
  bool vis = true;
  bool vis2 = true;
  bool vis3 = true;
  Absensi? absensi;
  String? name;
  String? nim;
  String? jenjang;
  String? prodi;
  String? namaOrtu;
  String? photo;
  String? statusOrtu;
  String? jenis;
  String? namaPeserta;

  // bool vis = false;
  // @override
  // void initState() {
  //   super.initState();
  //   absensi = Get.parameters['result'] as Absensi?;
  // }

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DataColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Absensi Wisuda",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: DataColors.primary800),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: 30.sp, left: 20.sp, right: 20.sp, bottom: 10.sp),
        child: jenis == cqr.tpmhs
            ? Visibility(
                visible: vis,
                child: ScanSukses(
                  name: name!,
                  nim: nim!,
                  jenjang: jenjang!,
                  namaOrtu: namaOrtu!,
                  photo: photo!,
                  prodi: prodi!,
                  statusOrtu: statusOrtu!,
                ),
              )
            : jenis == cqr.tportu
                ? Visibility(
                    visible: vis2,
                    child: ScanSuksesOrtu(
                      name: name!,
                      nim: nim!,
                      jenjang: jenjang!,
                      namaOrtu: namaOrtu!,
                      photo: photo!,
                      prodi: prodi!,
                      statusOrtu: statusOrtu!,
                    ),
                  )
                : jenis == cqr.tptamu
                    ? Visibility(
                        visible: vis3,
                        child: ScanSuksesTamu(namaPeserta: namaPeserta!))
                    : const SizedBox.shrink(),
      ),
      floatingActionButton: SpeedDial(
        // onPress: () {
        //   if (jenis == cqr.tpmhs && vis == true) {
        //     setState(() {
        //       vis == false;
        //     });
        //   } else if (jenis == cqr.tportu && vis2 == true) {
        //     setState(() {
        //       vis2 == false;
        //     });
        //   } else if (jenis == cqr.tptamu && vis3 == true) {
        //     setState(() {
        //       vis3 == false;
        //     });
        //   } 
        // },
        icon: Icons.add,
        backgroundColor: DataColors.primary600,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: Image.asset('assets/icons/user.png',
                width: 15.sp, height: 15.sp),
            onTap: () async {
              final result = await Get.to(QRScan(),
                  arguments: [data['id_petugas'], cqr.tpmhs]);
              if (result != null && result is List<String>) {
                setState(() {
                  name = result[0];
                  nim = result[1];
                  prodi = result[2];
                  jenjang = result[3];
                  namaOrtu = result[4];
                  statusOrtu = result[5];
                  photo = result[6];
                  jenis = result[7];
                });
              }
            },
            label: "Mahasiswa",
            labelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: DataColors.primary700),
          ),
          SpeedDialChild(
            child: Image.asset('assets/icons/user.png',
                width: 15.sp, height: 15.sp),
            onTap: () async {
              final result = await Get.to(QRScan(),
                  arguments: [data['id_petugas'], cqr.tportu]);
              if (result != null && result is List<String>) {
                setState(() {
                  name = result[0];
                  nim = result[1];
                  prodi = result[2];
                  jenjang = result[3];
                  namaOrtu = result[4];
                  statusOrtu = result[5];
                  photo = result[6];
                  jenis = result[7];
                });
              }
              ;
            },
            label: "Orang Tua",
            labelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: DataColors.primary700),
          ),
          SpeedDialChild(
            child: Image.asset('assets/icons/user.png',
                width: 15.sp, height: 15.sp),
            onTap: () async {
              final result = await Get.to(QRScan(),
                  arguments: [data['id_petugas'], cqr.tptamu]);
              if (result != null && result is List<String>) {
                setState(() {
                  namaPeserta = result[0];
                  jenis = result[1];
                });
              }
            },
            label: "Tamu",
            labelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: DataColors.primary700),
          ),
        ],
      ),
    );
  }
}

class ScanSukses extends StatelessWidget {
  final String name;
  final String nim;
  final String prodi;
  final String jenjang;
  final String namaOrtu;
  final String photo;
  final String statusOrtu;
  ScanSukses({
    Key? key,
    required this.name,
    required this.nim,
    required this.prodi,
    required this.jenjang,
    required this.namaOrtu,
    required this.photo,
    required this.statusOrtu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(0.sp),
          width: double.infinity,
          height: 380.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: DataColors.neutral200),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.sp),
                child: Center(
                  child: Container(
                    height: 150.sp,
                    width: 180.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: DataColors.white,
                      image: DecorationImage(
                          image: NetworkImage(photo), fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                height: 80.sp,
                width: 300.sp,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NIM",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          nim,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nama",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Prodi",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jenjang + prodi,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nama Orang Tua : ",
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Text(
                      namaOrtu,
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.sp),
                    Container(
                        height: 25.sp,
                        width: 25.sp,
                        decoration: BoxDecoration(
                            border: statusOrtu == "0"
                                ? Border.all(color: Colors.red, width: 1.5)
                                : Border.all(color: Colors.green, width: 1.5),
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: Center(
                            child: statusOrtu == "0"
                                ? const Icon(Icons.close)
                                : const Icon(Icons.check)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ScanSuksesOrtu extends StatelessWidget {
  final String name;
  final String nim;
  final String prodi;
  final String jenjang;
  final String namaOrtu;
  final String photo;
  final String statusOrtu;
  ScanSuksesOrtu({
    Key? key,
    required this.name,
    required this.nim,
    required this.prodi,
    required this.jenjang,
    required this.namaOrtu,
    required this.photo,
    required this.statusOrtu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(0.sp),
          width: double.infinity,
          height: 450.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: DataColors.neutral200),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.sp),
                child: Text(
                  namaOrtu,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.sp),
                child: Text(
                  "Orangtua dari Mahasiswa",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.sp),
                child: Center(
                  child: Container(
                    height: 150.sp,
                    width: 180.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: DataColors.white,
                      image: DecorationImage(
                          image: NetworkImage(photo), fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                height: 80.sp,
                width: 300.sp,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NIM",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          nim,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nama",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Prodi",
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          jenjang + prodi,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Center(
                child: Icon(
                  Icons.check,
                  color: Colors.blue[600],
                  size: 80.sp,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ScanSuksesTamu extends StatelessWidget {
  final String namaPeserta;

  ScanSuksesTamu({
    Key? key,
    required this.namaPeserta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(0.sp),
          width: double.infinity,
          height: 250.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: DataColors.neutral200),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.sp),
                child: Text(
                  "Tamu Undangan",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Center(
                child: Container(
                    padding: EdgeInsets.all(0.sp),
                    height: 155.sp,
                    width: 155.sp,
                    child: Center(
                      child: Icon(Icons.check, color: Colors.blue[600]),
                    )),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.sp),
                child: Text(
                  namaPeserta,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
