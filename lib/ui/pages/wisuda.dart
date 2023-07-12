import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:absensiwisuda/ui/theme/color.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

class WisudaPage extends StatefulWidget {
  @override
  State<WisudaPage> createState() => _WisudaPageState();
}

class _WisudaPageState extends State<WisudaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DataColors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 15.sp),
          child: Text(
            "Wisuda",
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
      body: Container(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Center(
              child: Text(
                "Selamat Atas Kelulusannya",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: DataColors.primary800,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.sp),
                child: Center(
                  child: QrImage(
                    data: "Nama Mahasiswa",
                    version: QrVersions.auto,
                    size: 250.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 7.sp),
              height: 80.sp,
              width: 300.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                color: DataColors.bluesky,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "NIM",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "7777B7777",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
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
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Asri Nurmalia",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
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
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "S1 Kesehatan Masyarakat",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
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
