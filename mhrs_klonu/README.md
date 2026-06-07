#  MHRS Klonu

Flutter ile geliştirilmiş, Merkezi Hekim Randevu Sistemi (MHRS) mobil uygulamasının arayüz klonudur. Bu proje, uygulamanın temel akışını ve ekran tasarımlarını içerir.

#  Özellikler

Uygulama şu anda aşağıdaki temel ekranları ve işlevleri içermektedir:

* Giriş Sistemi (`giris_sistemi.dart`): Kullanıcı adı/T.C. Kimlik No ve şifre ile güvenli giriş simülasyonu.
* Ana Ekran (`ana_ekran.dart`): Polikliniklerin, hastanelerin ve geçmiş randevuların listelendiği ekran.
* Randevu Sayfası (`randevu_sayfasi.dart`): İl,hastane, poliklinik,saat ve tarih seçilerek randevu alma adımlarının yönetildiği ekran.

# Kullanılan program
* Visual Studio Code(Flutter)

# Dil
* Dart 

## Ekran Görüntüleri

# Giriş Ekranı
![Giriş](./giris_ekrani.png)
* TC/Şifre ile giriş yapılan ekrandır

# Ana Ekran
![Ana Ekran](./ekran.png)
* Ana_ekran, Giris_sistemi ve Randevu_sayfasını'kodlarını içeren ekrandır

# Randevu Ekranı
![Randevu](./randevu_bilgisi.png)
* Randevunun aktif gözüktüğü ekrandır

# Widgetler 

# Yapısal Widget'lar
* Scaffold: Uygulama sayfalarının temel görsel iskeletini oluşturur appBar, body, drawer ve floatingActionButton gibi yapıları bir araya getirir.
* AppBar: Sayfaların en üstünde yer alan, başlık metnini ve aksiyon butonlarını barındıran standart uygulama çubuğudur.
* BottomNavigationBar: Sayfanın alt kısmında sekmeli geçiş (Randevularım ve Profilim sekmeleri) sağlayan alt gezinti çubuğudur.
* Drawer: Ekranın sol kenarından kaydırılarak açılan, kullanıcı bilgilerini ve çıkış yapma seçeneğini barındıran yan menüdür.
* MaterialApp: Uygulamanın en kök bileşenidir; navigasyon yönetimi, temanın (kırmızı renk teması) ve başlığın tüm uygulamaya dağıtılmasını sağlar.

# Düzen Widget'ları
* Column: İçerisine eklenen alt widget'ları dikey (yukarıdan aşağıya) bir hat üzerinde hizalamak için kullanılır.
* Row: İçerisine eklenen alt widget'ları yatay (soldan sağa) bir hat üzerinde yan yana dizmek için kullanılır.
* Stack: Alt widget'ları katmanlar halinde birbirinin üzerine bindirmek için kullanılır (Ana ekrandaki kırmızı renkli karşılama paneli arka planı için kullanılmıştır).
* ListView: Ekrana sığmayan dinamik veya statik içerikleri kaydırılabilir bir yapıda listelemek için kullanılır (Şehir arama ekranı ve yan menüde kullanılmıştır).
* GridView: İçerisine eklenen bileşenleri yan yana ve alt alta ızgara biçiminde hizalar (Randevu saatlerini 4 sütunlu kutular halinde listelemek için kullanılmıştır).

# İçerik Widget'ları
* Text: Ekranda statik veya dinamik metinleri, başlıkları ve açıklamaları göstermek için kullanılır.
* Image: Giriş ekranında internet üzerindeki bir URL'den (GitHub) MHRS logosunu çekip göstermek için kullanılmıştır.
* Icon: Uygulama içi görsel anlatımı güçlendirmek amacıyla kullanılan küçük hazır sembollerdir.
* Card: Kayıtlı randevu bilgilerini hafif gölgeli, köşeleri oval ve estetik bir kutu (kart) içerisinde göstermek için kullanılır.
* CircleAvatar: Genellikle profil resimleri için kullanılan yuvarlak hatlı bir görsel/ikon taşıyıcı widget'tır. Yan menüde vatandaş profil simgesi olarak kullanılmıştır.

# Girdi Widget'ları
* TextField: Kullanıcının T.C. Kimlik Numarası, şifre girmesini veya şehir araması yapabilmesini sağlayan metin giriş alanıdır.
* ElevatedButton: Arka plan rengi olan, belirgin, yükseltilmiş ve tıklanabilir ana buton türüdür (Giriş Yap ve Randevuyu Tamamla butonları).
* TextButton: Genellikle arka plan rengi olmayan, sade bir metinden oluşan tıklanabilir buton türüdür (e-Devlet ile Giriş Yap butonu).
* IconButton: Sadece bir ikondan oluşan ve tıklandığında işlem tetikleyen butondur (Randevu kartlarındaki silme/çöp kutusu butonu).

# Stil Widget'ları
* Padding: Bir widget'ın etrafına iç boşluk (mesafe) bırakarak bileşenlerin ekrana veya birbirine sıkışmasını önlemek amacıyla kullanılır.
* Container: İçerisine aldığı widget'lara genişlik, yükseklik, arka plan rengi veya kenarlık gibi dekoratif özellikler atayabilen çok amaçlı bir kutudur.
* SizedBox: Genellikle dikey veya yatayda bileşenler arasında belirli ölçülerde boşluklar (mesafeler) bırakmak için kullanılan boş kutulardır.
* Divider: Giriş ekranında butonlar arasında görsel bir ayrım oluşturmak için kullanılan ince, yatay çizgidir.
* ListTile: Genellikle listelerde (ListView) kullanılan; soluna ikon (leading), ortasına başlık (title) ve sağından aksiyon (trailing) alan hazır satır düzeni widget'ıdır.

# Gezinme Widget'ları ve Kodları
* Navigator.push: Uygulamada yeni bir sayfaya (Giriş ekranından Ana ekrana veya Randevu alma sayfasına) geçiş yapmayı sağlayan gezinme kodudur.
* MaterialPageRoute: Sayfa geçişleri esnasında hedef sayfanın Android ve iOS platform standartlarına uygun animasyonlarla açılmasını sağlayan rota tanımlayıcısıdır.
* Navigator.pop: Açık olan mevcut sayfayı kapatarak bir önceki sayfaya geri dönmeyi veya geriye seçilen bir veriyi aktarmayı sağlar.

# Projemde Kullandığım,Derste Öğrenmediğimiz İnternet Üzerinden Yardım Alarak eklediğim  Diğer Widgetler
* SingleChildScrollView: Ekrandaki içeriğin (özellikle klavye açıldığında veya küçük ekranlarda) taşmasını önleyerek dikeyde kaydırılabilir olmasını sağlar.
* DropdownButtonFormField: Kullanıcının açılır bir menüden listelenen seçenekler arasından seçim yapmasını sağlayan form uyumlu bir kutudur (Poliklinik seçimi için kullanılmıştır).
* FloatingActionButton.extended: Ekranın üzerinde sabit duran, oval ve hem ikon hem de metin barındırabilen gelişmiş bir tetikleme butonudur (Randevu Al butonu).
* GestureDetector: Tıklama özelliği olmayan metin veya alanlara dokunma, çift tıklama gibi etkileşim özellikleri kazandırır (ALO 182 yazısına tıklanabilmesi için kullanılmıştır).
* Form: Giriş ekranında metin alanlarını tek bir çatı altında toplayarak form kontrolü ve doğrulama yapısını hazırlayan sarmalayıcı yapıdır.
* DrawerHeader: Yan menünün (Drawer) en üstünde yer alan, arka plan rengi ve profil bilgilerini barındıran özel başlık alanıdır.
* FilteringTextInputFormatter.digitsOnly: T.C. Kimlik Numarası alanına sadece rakam girilmesini zorunlu kılan girdi biçimlendiricisidir.
* ThemeData: Uygulamanın yazı renkleri, AppBar arka plan renkleri gibi genel görsel stil kurallarını merkezi olarak belirleyen tema yapılandırmasıdır.

# Ad-Soyad-Numara
* Musa Öztürk 254602005 
