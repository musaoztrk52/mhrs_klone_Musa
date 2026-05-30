import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/giris_sistemi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MHRSUygulamasi());
}

class MHRSUygulamasi extends StatelessWidget {
  const MHRSUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MHRS_CLONE',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFE10613),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE10613),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const GirisSistemi(),
    );
  }
}