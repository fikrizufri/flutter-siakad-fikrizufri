import 'package:flutter/material.dart';
import 'package:flutter_siakad/data/datasource/auth_local_datasource.dart';
import 'package:flutter_siakad/pages/auth/splash_page.dart';
import 'package:flutter_siakad/pages/mahasiswa/mahasiswa_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: AuthLocalDataSource().isLogin(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            return const MahasiswaPage();
          } else {
            return const SplashPage();
          }
        },
      ),
    );
  }
}
