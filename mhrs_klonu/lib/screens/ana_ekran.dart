import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'randevu_sayfasi.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  final List<Map<String, String>> _randevular = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Randevu Bilgilerim", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: _randevular.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 80, color: Colors.grey.shade300),
                        const SizedBox(height: 10),
                        const Text("Henüz bir randevunuz yok.", style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: _randevular.length,
                    itemBuilder: (c, i) => Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.medical_services_outlined, color: Colors.red),
                        ),
                        title: Text(_randevular[i]['hastane']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("${_randevular[i]['poliklinik']}\n${_randevular[i]['tarih']} • ${_randevular[i]['saat']}"),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.cancel_outlined, color: Colors.redAccent),
                          onPressed: () => setState(() => _randevular.removeAt(i)),
                        ),
                      ),
                    ),
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.support_agent, color: Colors.red),
                const SizedBox(width: 10),
                const Text("Randevu Hattı: "),
                GestureDetector(
                  onTap: () async {
                    final Uri tel = Uri.parse("tel:182");
                    if (await canLaunchUrl(tel)) await launchUrl(tel);
                  },
                  child: const Text("ALO 182", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFE10613),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Randevu Al", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        onPressed: () async {
          final res = await Navigator.push(context, MaterialPageRoute(builder: (c) => const IlSecimi()));
          if (res != null) setState(() => _randevular.add(res));
        },
      ),
    );
  }
}