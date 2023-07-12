import 'package:absensiwisuda/controller/login_c.dart';
import 'package:absensiwisuda/ui/pages/dashboard.dart';
import 'package:absensiwisuda/ui/pages/login.dart';
import 'package:absensiwisuda/ui/pages/qrcode.dart';
import 'package:absensiwisuda/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomNavigationBarExample extends StatefulWidget {
  

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
      AuthController c = Get.find<AuthController>();
  int _selectedIndex = 0;
  final box = GetStorage();
  String datapetugas = "";
 
  
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    QrCodeScreenWidget()
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Get.defaultDialog(
        middleText: "Apakah Anda Yakin untuk Logout?",
        onConfirm: () => c.logout(datapetugas),
        onCancel: () => dispose()
      );
    } else {
      setState(() {
      _selectedIndex = index;
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
     Map data = box.read("dataUser") as Map<String, dynamic>;
     datapetugas = data['id_petugas'];
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DataColors.bluesky,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2),
            label: 'Absensi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: DataColors.primary700,
        onTap: _onItemTapped,
      ),
    );
  }
}