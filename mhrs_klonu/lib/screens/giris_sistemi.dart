import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
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
  bool _sifreGizli = true;

  // Şifre kuralları
  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasDigits = false;
  bool _hasSpecialChar = false;

  @override
  void initState() {
    super.initState();
    _sifreController.addListener(_sifreDurumunuKontrolEt);
  }

  void _sifreDurumunuKontrolEt() {
    final s = _sifreController.text;
    setState(() {
      _hasMinLength = s.length >= 6;
      _hasUppercase = s.contains(RegExp(r'[A-Z]'));
      _hasLowercase = s.contains(RegExp(r'[a-z]'));
      _hasDigits = s.contains(RegExp(r'[0-9]'));
      _hasSpecialChar = s.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  // sifre  içinde olması gereken karakterleri belirten fonksiyon
  String? _sifreHataMesajiOlustur() {
    if (_hasMinLength && _hasUppercase && _hasLowercase && _hasDigits && _hasSpecialChar) {
      return null; 
    }
    
    List<String> eksikler = [];
    if (!_hasMinLength) eksikler.add("en az 6 karakter");
    if (!_hasUppercase) eksikler.add("büyük harf");
    if (!_hasLowercase) eksikler.add("küçük harf");
    if (!_hasDigits) eksikler.add("rakam");
    if (!_hasSpecialChar) eksikler.add("özel karakter");

    return "Şifre uymuyor! Eksikler: ${eksikler.join(', ')}";
  }

  @override
  void dispose() {
    _tcController.dispose();
    _sifreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, 
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE10613), Color(0xFFB71C1C), Colors.black87],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Hero(
                tag: 'logo',
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: Image.network(
                    'https://raw.githubusercontent.com/orhanbaran/mhrs-logo/main/mhrs_logo_new.png', 
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.calendar_month, size: 60, color: Color(0xFFE10613));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text("MHRS", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 2)),
              const Text("T.C. SAĞLIK BAKANLIĞI", style: TextStyle(color: Colors.white70, fontSize: 12, letterSpacing: 1)),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, -10))],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _tcController,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              labelText: "T.C. Kimlik No",
                              prefixIcon: const Icon(Icons.badge_outlined),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              counterText: "",
                            ),
                            validator: (v) => (v?.length != 11) ? "11 haneli TC giriniz" : null,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _sifreController,
                            obscureText: _sifreGizli,
                            decoration: InputDecoration(
                              labelText: "Parola",
                              
                              errorMaxLines: 2, 
                              prefixIcon: const Icon(Icons.lock_open_rounded),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              suffixIcon: IconButton(
                                icon: Icon(_sifreGizli ? Icons.visibility_off : Icons.visibility),
                                onPressed: () => setState(() => _sifreGizli = !_sifreGizli),
                              ),
                            ),
                            validator: (v) => _sifreHataMesajiOlustur(),
                          ),

                          const SizedBox(height: 25),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE10613),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 60),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              elevation: 5,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const AnaEkran()));
                              }
                            },
                            child: const Text("GİRİŞ YAP", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 15),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 55),
                              side: const BorderSide(color: Color(0xFF1565C0), width: 1.5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed: () async {
                              final Uri url = Uri.parse("https://giris.turkiye.gov.tr/");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url, mode: LaunchMode.externalApplication);
                              }
                            },
                            icon: const Icon(Icons.account_balance, color: Color(0xFF1565C0)),
                            label: const Text("e-Devlet Kapisı ile Giriş", style: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}