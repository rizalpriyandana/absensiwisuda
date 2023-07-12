import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TestPage extends StatefulWidget {
  

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ClipPath(
              clipper: TriangleClipper(),
                child: Container(
      width: 200.sp,
      height: 200.sp,
      color: Colors.blue,
    ))));
  }
}
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final startPoint = Offset(0, size.height); // Titik awal
    final controlPoint = Offset(size.width / 2, 0); // Titik kendali (untuk melengkung)
    final endPoint = Offset(size.width * 0.75, size.height); // Titik akhir (lebih ke tengah)

    path.moveTo(startPoint.dx, startPoint.dy); // Pindah ke titik awal
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy); // Garis melengkung
    path.lineTo(size.width, size.height); // Garis lurus ke titik kanan bawah
    path.close(); // Menutup path

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
