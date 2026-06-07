import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'randevu_sayfasi.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  int _secilenIndis = 0;
  final List<Map<String, String>> _aktifRandevular = [];
  // Burada Ana Ekranı oluşturdum ve tasarımını yaptım

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("MHRS Ana Ekran"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFE10613)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.person, color: Color(0xFFE10613), size: 35),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Vatandaş Profili", 
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Ana Sayfa"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      //Burada Hangi İşlemi Yapacağı konusunda Yönlendirmeler oluşturdum
      body: _secilenIndis == 0
          ? Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 90,
                      width: double.infinity,
                      color: Colors.red.shade50,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sağlıklı Günler!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFB71C1C))),
                          SizedBox(height: 5),
                          Text("Randevularınızı bu panelden takip edebilirsiniz.", style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month, color: Color(0xFFE10613)),
                      SizedBox(width: 10),
                      Text("Kayıtlı Randevularınız", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Expanded(
                  child: _aktifRandevular.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today_outlined, size: 70, color: Colors.grey.shade300),
                              const SizedBox(height: 10),
                              const Text("Henüz bir randevu almadınız.", style: TextStyle(color: Colors.grey, fontSize: 15)),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: _aktifRandevular.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                title: Text(_aktifRandevular[index]['hastane']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text("${_aktifRandevular[index]['poliklinik']}\nTarih: ${_aktifRandevular[index]['tarih']} • Saat: ${_aktifRandevular[index]['saat']}"),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      _aktifRandevular.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
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
            )
            //Bu Kısım Profil ve Ayarlar Kısmı Özellikleri
          : const Center(
              child: Text("Profil ve Ayarlar Sayfası"),
            ),
      floatingActionButton: _secilenIndis == 0
          ? FloatingActionButton.extended(
              backgroundColor: const Color(0xFFE10613),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text("Randevu Al", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () async {
                final sonuc = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IlSecimi()),
                );
                if (sonuc != null) {
                  setState(() {
                    _aktifRandevular.add(sonuc);
                  });
                }
              },
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _secilenIndis,
        onTap: (indis) {
          setState(() {
            _secilenIndis = indis;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Randevularım"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profilim"),
        ],
      ),
    );
  }
}