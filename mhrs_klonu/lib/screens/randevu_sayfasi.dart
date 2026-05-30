import 'package:flutter/material.dart';

// --- ŞEHİR SEÇİM ALANI ---
class IlSecimi extends StatefulWidget {
  const IlSecimi({super.key});
  @override
  State<IlSecimi> createState() => _IlSecimiState();
}

class _IlSecimiState extends State<IlSecimi> {
  final List<String> _iller = [
    "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"
  ];
  List<String> _filtrelenmis = [];

  @override
  void initState() { 
    super.initState(); 
    _filtrelenmis = _iller; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Şehir Seçimi")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Şehir ara...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (v) => setState(() => _filtrelenmis = _iller.where((il) => il.toLowerCase().contains(v.toLowerCase())).toList()),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _filtrelenmis.length,
              separatorBuilder: (c, i) => const Divider(height: 1),
              itemBuilder: (c, i) => ListTile(
                title: Text(_filtrelenmis[i], style: const TextStyle(fontWeight: FontWeight.w500)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () async {
                  final res = await Navigator.push(context, MaterialPageRoute(builder: (ctx) => PoliklinikSecimi(il: _filtrelenmis[i])));
                  if (res != null && context.mounted) {
                    Navigator.pop(context, res);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- POLİKLİNİK VE SAAT SEÇİM ALANI ---
class PoliklinikSecimi extends StatefulWidget {
  final String il;
  const PoliklinikSecimi({super.key, required this.il});
  @override
  State<PoliklinikSecimi> createState() => _PoliklinikSecimiState();
}

class _PoliklinikSecimiState extends State<PoliklinikSecimi> {
  String? _p; 
  String? _s;
  DateTime _t = DateTime.now().add(const Duration(days: 1));
  late List<String> _saatListesi;

  final List<String> _poller = [
    "Dahiliye", "Göz Hastalıkları", "KBB", "Kardiyoloji", "Nöroloji", "Cildiye", "Ortopedi", "Psikiyatri", 
    "Genel Cerrahi", "Üroloji", "Göğüs Hastalıkları", "Çocuk Sağlığı", "Fizik Tedavi", "Diş Ünitesi", "Gastroenteroloji"
  ];

  @override
  void initState() {
    super.initState();
    _saatListesi = _saatleriUret();
  }

  List<String> _saatleriUret() {
    List<String> saatler = [];
    for (int h = 9; h < 17; h++) {
      if (h == 12) continue;
      for (int m = 0; m < 60; m += 15) {
        saatler.add("${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}");
      }
    }
    return saatler;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.il)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Klinik Bilgisi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              items: _poller.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() { _p = v; _s = null; }),
              hint: const Text("Poliklinik seçiniz"),
            ),
            const SizedBox(height: 25),
            const Text("Randevu Tarihi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                final d = await showDatePicker(
                  context: context, 
                  initialDate: _t, 
                  firstDate: DateTime.now(), 
                  lastDate: DateTime.now().add(const Duration(days: 30))
                );
                if (d != null) setState(() => _t = d);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${_t.day}.${_t.month}.${_t.year}", style: const TextStyle(fontSize: 16)),
                    const Icon(Icons.calendar_month, color: Colors.red),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            if (_p != null) ...[
              const Text("Müsait Saatler (15 dk)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, 
                  childAspectRatio: 2.2, 
                  mainAxisSpacing: 10, 
                  crossAxisSpacing: 10
                ),
                itemCount: _saatListesi.length,
                itemBuilder: (c, i) {
                  final s = _saatListesi[i];
                  bool isSelected = _s == s;
                  return ChoiceChip(
                    label: Text(s, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                    selected: isSelected,
                    selectedColor: const Color(0xFFE10613),
                    onSelected: (val) => setState(() => _s = val ? s : null),
                    showCheckmark: false,
                  );
                },
              ),
            ],
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE10613),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: (_p != null && _s != null) 
                ? () => Navigator.pop(context, {
                    "hastane": "${widget.il} Devlet Hastanesi", 
                    "poliklinik": _p!, 
                    "saat": _s!, 
                    "tarih": "${_t.day}.${_t.month}.${_t.year}"
                  }) 
                : null,
              child: const Text("RANDEVUYU TAMAMLA", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}