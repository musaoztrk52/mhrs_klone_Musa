import 'package:flutter/material.dart';
import 'screens/giris_sistemi.dart';

void main() {
  runApp(const MHRSUygulamasi());
}

class MHRSUygulamasi extends StatelessWidget {
  const MHRSUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sağlık Bakanlığı MHRS',
      theme: ThemeData(
        primaryColor: const Color(0xFFE10613),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE10613),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const GirisSistemi(),
    );
  }
}
 // Bu uygulama Mobil Programlama dersi kapsamında geliştirilmiştir.