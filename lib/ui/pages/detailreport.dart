// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:absensiwisuda/controller/dashboard_c.dart';
import 'package:absensiwisuda/controller/detailreport_c.dart';
import 'package:absensiwisuda/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class DetailReportPage extends StatefulWidget {
  @override
  State<DetailReportPage> createState() => _DetailReportPageState();
}

class _DetailReportPageState extends State<DetailReportPage> {
  DetailReportController dc = Get.put(DetailReportController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 30.sp),
        child: AppBar(
          backgroundColor: DataColors.white,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 15.sp),
            child: Text(
              "Detail",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: DataColors.primary800),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(top: 13.sp),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: DataColors.primary800,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            FutureBuilder(
              future: dc.getjenjang(data['id_petugas']),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: DataColors.primary700,
                    ),
                  );
                } else {
                  return ListJenjang(
                      jenjang: dc.jenjangku,
                      totalwisuda: dc.totalwisuda.toString());
                }
              },
            ),
            SizedBox(
              height: 15.sp,
            ),
            FutureBuilder(
              future: dc.getprodi(data['id_petugas']),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: DataColors.primary700,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: dc.total.value,
                    itemBuilder: (BuildContext context, int index) {
                      return ListDataProdi(
                        jenjang: dc.jenjang,
                        prodi: dc.prodi,
                        totaldaftar: dc.totalterdaftar.toString(),
                        totalhadir: dc.totalhadir.toString(),
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class ListJenjang extends StatelessWidget {
  final String jenjang;
  final String totalwisuda;

  ListJenjang({
    Key? key,
    required this.jenjang,
    required this.totalwisuda,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.sp),
      child: Container(
        height: 110.sp,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          color: DataColors.bluesky,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 2.sp,
              ),
              width: double.infinity,
              height: 30.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.sp),
                      topRight: Radius.circular(5.sp)),
                  color: Colors.blue[700]),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 41.sp),
                    child: Text(
                      jenjang[0],
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: DataColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 67.sp),
                    child: Text(
                      jenjang[1],
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: DataColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 70.sp),
                    child: Text(
                      jenjang,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: DataColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 70.sp),
                    child: Text(
                      jenjang[2],
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: DataColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 70.sp),
                    child: Text(
                      jenjang[3],
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: DataColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 2.sp),
                    child: Column(
                      children: [
                        Text(
                          totalwisuda[0],
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: DataColors.primary800,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Mahasiwa",
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: DataColors.primary800,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        totalwisuda,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Mahasiwa",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        totalwisuda,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Mahasiwa",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        totalwisuda,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Mahasiwa",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0.sp),
                    child: Column(
                      children: [
                        Text(
                          totalwisuda,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: DataColors.primary800,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Mahasiwa",
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: DataColors.primary800,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListDataProdi extends StatelessWidget {
  final String jenjang;
  final String prodi;
  final String totaldaftar;
  final String totalhadir;

  ListDataProdi({
    Key? key,
    required this.jenjang,
    required this.prodi,
    required this.totaldaftar,
    required this.totalhadir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.sp,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        color: DataColors.bluesky,
      ),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 5.sp, left: 10.sp),
              width: double.infinity,
              height: 30.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.sp),
                      topRight: Radius.circular(5.sp)),
                  color: Colors.blue[700]),
              child: Row(
                children: [
                  Text(
                    "Prodi + $jenjang",
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: DataColors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Text(
                    prodi,
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: DataColors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(top: 20.sp),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.sp),
                  child: Column(
                    children: [
                      Text(
                        "Terdaftar",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        totaldaftar,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: DataColors.primary800,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100.sp,
                ),
                Column(
                  children: [
                    Text(
                      "Hadir",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: DataColors.primary800,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      totalhadir,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: DataColors.primary800,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
