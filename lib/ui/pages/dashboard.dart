import 'package:absensiwisuda/controller/dashboard_c.dart';
import 'package:absensiwisuda/ui/pages/detailreport.dart';
import 'package:absensiwisuda/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController dc = Get.find<DashboardController>();

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size(0, 25.sp),
        child: AppBar(
          backgroundColor: DataColors.white,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 15.sp),
            child: Text(
              "Home",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: DataColors.primary800),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
            right: 10.sp, left: 10.sp, bottom: 10.sp, top: 25.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150.sp,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  image: DecorationImage(
                      image: AssetImage("assets/images/bgwisuda.png"),
                      fit: BoxFit.fill),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40.sp, left: 20.sp, right: 20.sp),
                  child: Text(
                    data['keterangan'],
                    style: TextStyle(
                        color: DataColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              FutureBuilder(
                future: dc.profile(data['id_petugas']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: DataColors.primary700,
                      ),
                    );
                  } else {
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.sp),
                          child: Container(
                            height: 20.sp,
                            width: 20.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.sp),
                                color: Colors.green),
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Text(
                          "Petugas Aktif : ",
                          style: TextStyle(
                              color: DataColors.primary700,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15.sp,
                        ),
                        Text(dc.totalPetugas.value.toString()),
                      ],
                    );
                  }
                },
              ),
              SizedBox(
                height: 30.sp,
              ),
              FutureBuilder(
                future: dc.statsabsensi(data['id_petugas']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: DataColors.primary700,
                      ),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.only(right: 10.sp, left: 10.sp),
                      height: 135.sp,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Informasi Peserta Wisuda",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: DataColors.black),
                          ),
                          SizedBox(
                            height: 2.sp,
                          ),
                          Container(
                            height: 3.sp,
                            width: 85.sp,
                            color: Colors.blue[600],
                          ),
                          SizedBox(
                            height: 7.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mahasiswa",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: DataColors.black),
                              ),
                              Text(
                                "${dc.totalPesertamhs.value.toString()} Orang",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: DataColors.black),
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
                                "Orang Tua",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: DataColors.black),
                              ),
                              Text(
                                "${dc.totalPesertaortu.value.toString()} Orang",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: DataColors.black),
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
                                "Tamu",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: DataColors.black),
                              ),
                              Text(
                                "${dc.totalPesertatamu.value.toString()} Orang",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: DataColors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Container(
                            height: 35.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: DataColors.blusky,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.sp),
                                  child: Text(
                                    "Total Peserta",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: DataColors.black),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.sp),
                                  child: Text(
                                    "${dc.totalpeserta.toString()} Orang",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: DataColors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 10.sp,
              ),
              FutureBuilder(
                future: dc.statsabsensi(data['id_petugas']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: DataColors.primary700,
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: 5.sp, left: 10.sp, right: 10.sp),
                      child: Container(
                        padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                        height: 190.sp,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: DataColors.primary700, width: 1.5.sp),
                          borderRadius: BorderRadius.circular(7.sp),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.sp),
                              child: Text(
                                "Data Absensi",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: DataColors.primary800),
                              ),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5.sp, right: 5.sp),
                              child: Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mahasiswa",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 148.sp,
                                      ),
                                      Text(
                                        dc.totalAbsensimhs.value.toString(),
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5.sp),
                                      InkWell(
                                          onTap: () {
                                            Get.to(DetailReportPage());
                                          },
                                          child: Icon(
                                            Icons.play_arrow,
                                            size: 20.sp,
                                            color: Colors.blue,
                                          ))
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0.sp),
                                    height: 20.sp,
                                    width: double.infinity,
                                    color: DataColors.neutral200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(
                                          () => Container(
                                              height: 20.sp,
                                              width:
                                                  dc.totalAbsensimhs.value.sp,
                                              color: Colors.blue[700]),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5.sp, right: 5.sp),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Orang Tua",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      // SizedBox(
                                      //   width: 168.sp,
                                      // ),
                                      Text(
                                        dc.totalAbsensiortu.value.toString(),
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(width: 5.sp),
                                      // InkWell(
                                      //     onTap: () {
                                      //       Get.snackbar(
                                      //           "Hi", "Detail Absensi Mahasiswa");
                                      //     },
                                      //     child: Icon(
                                      //       Icons.play_arrow,
                                      //       size: 20.sp,
                                      //       color: Colors.blue,
                                      //     ))
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0.sp),
                                    height: 20.sp,
                                    width: double.infinity,
                                    color: DataColors.neutral200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 20.sp,
                                            width: dc.totalAbsensiortu.value.sp,
                                            color: Colors.blue[700]),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5.sp, right: 5.sp),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tamu",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      // SizedBox(
                                      //   width: 168.sp,
                                      // ),
                                      Text(
                                        dc.totalAbsensitamu.value.toString(),
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(width: 5.sp),
                                      // InkWell(
                                      //     onTap: () {
                                      //       Get.snackbar(
                                      //           "Hi", "Detail Absensi Mahasiswa");
                                      //     },
                                      //     child: Icon(
                                      //       Icons.play_arrow,
                                      //       size: 20.sp,
                                      //       color: Colors.blue,
                                      //     ))
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0.sp),
                                    height: 20.sp,
                                    width: double.infinity,
                                    color: DataColors.neutral200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(
                                          () => Container(
                                              height: 20.sp,
                                              width:
                                                  dc.totalAbsensitamu.value.sp,
                                              color: Colors.blue[700]),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
