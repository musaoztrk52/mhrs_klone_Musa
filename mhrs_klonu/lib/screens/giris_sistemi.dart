import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ana_ekran.dart';

class GirisSistemi extends StatefulWidget {
  const GirisSistemi({super.key});
  @override
  State<GirisSistemi> createState() => _GirisSistemiState();
}

class _GirisSistemiState extends State<GirisSistemi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tcController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();

  @override
  void dispose() {
    _tcController.dispose();
    _sifreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MHRS Giriş"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.network(
                  'https://raw.githubusercontent.com/orhanbaran/mhrs-logo/main/mhrs_logo_new.png',
                  height: 100,
                  errorBuilder: (c, e, s) => const Icon(Icons.local_hospital, size: 100, color: Colors.red),
                ),
                const SizedBox(height: 10),
                const Text(
                  "T.C. Sağlık Bakanlığı",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _tcController,
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: "T.C. Kimlik No",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    counterText: "",
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _sifreController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Şifre",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE10613),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_tcController.text.length == 11 && _sifreController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AnaEkran()),
                      );
                    }
                  },
                  child: const Text("GİRİŞ YAP"),
                ),
                const SizedBox(height: 15),
                const Divider(color: Colors.grey, thickness: 1),
                TextButton(
                  onPressed: () {},
                  child: const Text("e-Devlet ile Giriş Yap"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}