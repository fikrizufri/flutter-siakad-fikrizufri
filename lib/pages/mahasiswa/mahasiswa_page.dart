import 'package:flutter/material.dart';
import 'package:flutter_siakad/common/constants/colors.dart';
import 'package:flutter_siakad/common/constants/icons.dart';
import 'package:flutter_siakad/pages/mahasiswa/dashboard_page.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const Center(
      child: Text("Schedule"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: ColorName.primary,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                IconName.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                IconName.chart,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                IconName.profile,
              ),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}
