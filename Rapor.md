<div align="center">
  <br><br><br><br><br>
  
  # PROJE ADI VE KONUSU
  ## DevStack Kişisel Portfolyo
  
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
  **Öğrenci Bilgileri:** Eray Mahmut Konukoğlu - 24302043 <br>
  **Proje Linki:** [Github/RayEcoX/Devstack-Portfolyo](https://github.com/RayEcoX/Devstack-Portfolyo)
  
  <br><br><br><br><br>
</div>
<div style="page-break-after: always;"></div>

Merhaba,
 ben Eray Mahmut Konukoğlu Flutter ile yazılım geliştirme yapıyorum.
 Projem kişisel Devstack Portfolyo uygulaması.
 Projemde Flutterın temel widgetlarını kullandım.
 Tabi bunları kullanırken büyük oranda AI yardımı aldım.Ancak bu yardımlar ince elenip sık dokunarak optimize edilmiş ve isteklerim doğrultusunda şekillendirilmiştir.Amacım kendi portfolyomu  flutter üzerinden sunmak.

 Projem 3 farklı sayfadan oluşmaktadır.
 -Ana sayfa
 -Liste sayfası
 -Detay sayfası 
 Projemin ana yapısı olan Main.dart ile 4 arka planda 4 adet sayfamız bulunmakta.

 ## 1. ANA YAPI VE MODÜLERLİK (main.dart)

 İmportlarla başlayım.
 
 **Hedef Kod**
 ```dart
 import 'package:flutter/material.dart';
 ```
  İlk importumuz flutterın kendi kütüphanesi.Hazır UI barındıran bir kütüphane.içerisinde Text,Container,Scaffold,AppBar gibi yüzlerce widget var.

  ***Hedef Kod***
  ```dart
  import 'anasayfa.dart';
  import 'liste_sayfasi.dart';
  import 'detay_sayfasi.dart';
  ```
  Daha sonra projenin diğer sayfalrını import ediyoruz .Bunlar kendi yazdığımız dosyalar.Her sayfa ayrı bir .dart dosyasında tutulduğu için,main.dart'ın onları tanıması lazım.

Geldik başlangıca 
**Hedef Kod:**
```dart
void main() {
  runApp(const DevStackApp());
}
Uygulamanın başlangıç noktası burasıdır.Fluttera özel bir fonsiyon olan runApp ile içine verdiğimiz DevStackApp widgetını çalıştırıyoruz.Böylece DevStackApp ekranın tamamına yerleştiriliyor.
const ise içeriği değiştirilmiycek performans için bellekte sabit tut demek.Yani her seferinde yeniden oluşturulmuyor.

**Hedef Kod:**
```dart
class DevStackApp extends StatelessWidget {
  const DevStackApp({super.key});

Yeni bir class oluşturuyoruz.Adına da DevStackApp diyoruz.StatelessWidget ise durumu değişmeyen widget demek.Yani bir kere çizilir ve kullanıcı etkileşimiyle kendi kendine değişmez.
Bunu kullanmamım sebebi sayfada dinamik değişiklik olmaması.
Altınada sınıfın yapıcı metodu olan const DevStackApp({super.key}); yazıyoruz.super.key   Flutterın her widgetı takip etmesi için kullandığı benzersiz anahtar.Bunu üst sınıfa iletiyoruz.Tüm ayarlarımızı bir widget içine tanımladık.

**Hedef Kod**
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevStack Portfolyo',

Uygulamanın iskeletini MaterialApp ile oluşturuyoruz.
debugShowCheckedModeBanner: false,   Uygulamanın sağ üst köşesinde çıkan "Debug" yazısını kaldırır.Normalde kırmızı renkte "DEBUG" yazısı çıkar.
title: 'DevStack Portfolyo',   Uygulamanın adıdır.Telefonun uygulama çekmecesinde veya görev yöneticisinde bu isimle görünecek.

**Hedef Kod:**
```dart
theme: ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
)
 Her sayfada arka plan siyah olsun istediğimden bu global ayarı yapıp kod kalabalığı yapmadan karanlık temaya sahip olduk. Hep dark mode sevmişimdir zaten uygulamamda da kullanmış olduk.
 
**Hedef Kod**
      initialRoute: '/',
      routes: {
        '/': (context) => const AnaSayfa(),
        '/skills': (context) => const ListeSayfasi(),
        '/detail': (context) => const DetaySayfasi(),
      },

initialRoute: '/',  Uygulama açıldığında ilk hangi sayfanın açılacağını belirtir.Burada '/' ana sayfayı temsil ediyor.

routes:  Uygulamada kullanacağımız sayfaları tanımladığımız yerdir.Burada her sayfanın bir adresi var.Bu adresleri kullanarak sayfalar arasında geçiş yapıyoruz. '/' Anasayfa olarak tanımlandı.
Bu kısım bir harita gibi düşünülebilir.

## 2. ANA SAYFA (anasayfa.dart)

Anasayfaya başlarken kütüphane import edip class oluşturma işlemini tekrarlıyoruz.

Ardından 
**Hedef Kod**
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PORTFOLYO",
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
 Sayfanın iskeletini oluşturuyoruz.
 AppBar:Üstteki çubuk.Buraya başlık, butonlar, ikonlar eklenir.
 title: AppBarın başlığı.Buraya "PORTFOLYO" yazısını ekledik.
 style: Yazının stilini kalınlığını ve harfler arası boşluğunu ayarladık.
 centerTitle: false,  Başlığın ortada değil, sola yaslı olmasını sağlar.
 backgroundColor: Colors.transparent,  AppBarın arka plan rengini şeffaf yapar.
 elevation: 0,  AppBarın gölgesini kaldırır.

**Hedef Bölge**
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),

Ekranda App barın altında kalan tüm alana body denir.Bizde bu alana widgetlarımızı ekleyeceğiz.
Padding ile iç boşluk eklerken Column ile dikey olarak widgetları sıralıyoruz.Elemanlar arasına boşluk eklemek içinde SizedBox kullanıyoruz.

**Hedef Kod**
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.code_outlined, color: Colors.white, size: 40),
                  const SizedBox(height: 16),
                  const Text(
                    "Merhaba, Ben Eray,\nFlutter Geliştiricisiyim.",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Minimalist ve performanslı mobil uygulamalar geliştiriyorum.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

Anasayfamızda bizi karşılayan büyük kutu.İçerisinde bir ikon,bir başlık ve bir açıklama bulunmakta.
Container  flutterın esnek kutu widget'ı.Renk boyut kenar yuvarlama falan hepsini container ile yapabiliriz.
width zaten genişlik demek double.infinity ise ekranın sonsuz genişliği demek.Yani container ekranın tamamını kaplar.
BoxDecoration ise containerın süsleme kutusu aslında. Yani renk,kenar yuvarlama,gölge falan hepsini burada yaparız.
color:Theme.of(context).cardColor ile main dartta yaptığımız global ayarı çektik.Yani main dartta dark mode ayarı yapmasaydık burası siyah olmazdı.
borderRadius: BorderRadius.circular(24),  Containerın kenarlarını 24 pixel olması gerek yuvarladı daha yumuşak bir görünüm kazandık.
CrossAxisAlignment.start ise containerın içindeki widgetları sola yaslar.Yani ikon,başlık ve açıklama sola yaslı durur.
ikonlar için flutterın hazır nimetlerinden yaralanıyoruz.
Icon(Icons.code_outlined, color: Colors.white, size: 40), Bu hazır ikon seti ile renk ve boyut ayarladık.Burdaki code_outlined </> benzeri bir kod ikonu onu kullandık.
Text fonksiyonumuz var height ile satır aralığımızı düzenliyoruz. Ve Colors.greylede alt metnimizi ana başlıktan daha solgun hale getirdik.

**Hedef Kod**
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [

Bu kısımda altda yan yana iki kutunun Bento Box düzeninde olmasını sağlıyor ve Expanded ile kutuların ekranın geri kalanını kaplamasını sağlıyoruz.Row ile de yatayda sıralıyoruz.

**Hedef Kod**
                  // Sol sütun: İki küçük kutu üst üste
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.timer_outlined, size: 32),
                                const SizedBox(height: 8),
                                Text(
                                  "Deneyim",
                                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                                ),
                                const Text(
                                  "1 Yıl",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on_outlined, size: 32),
                                SizedBox(height: 8),
                                Text(
                                  "Erzurum",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

Burası biraz kalabalık duruyor ama yakından baktığımızda çok da karışık değil. Aslında burada yaptığımız şey yan yana duran iki bölmenin sol tarafını hazırlamak.

En baştaki Expanded(flex: 4) kısmı önemli. Bu "sol sütun yatay genişliğin 4 birimini alsın" demek.

Sonrasında bir `Column` (dikey sütun) açıyoruz çünkü buraya alt alta iki küçük kutu ekleyeceğiz.
Alt alta eklediğimiz bu iki kutunun da birbirini ezmemesi ve eşit dikey alan kaplaması için her ikisini de `Expanded` içine aldık. 

Kutuların yapısı ise yukarıdaki o büyük profil kutusuna çok benziyor:
`Container` ile kutu sınırlarını belirledik, `BoxDecoration` ile köşeleri aynı oranda (24 piksel) yuvarlattık. İçine de `mainAxisAlignment: MainAxisAlignment.center` diyerek ikonları ve metinleri kutunun tam ortasına hizaladık. 

**Hedef Kod**
                  // Sağ sütun: Yetenekler sayfasına giden büyük kutu
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/skills');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(Icons.arrow_forward),
                            ),
                            const Spacer(),
                            const Text(
                              "Yeteneklerim",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Yazılım ve\nTasarım araçları",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

Yine benzer şekiklde Expanded(flex: 5, ...) yaparak sağ sütunun 5 birim almasını sağladık.
GestureDetector ile de bu kutuya tıklandığında bu olayı algılamasını sağladık.Navigator.pushNamed(context, '/skills') ile de haritamızı kullandık ve skills sayfasına geçiş sağladık
Spacer() ise aradaki boşlukları doldurmak için kullanılıyor.Burada 3 tane spacer kullandık.Birincisi ikonun üstünde, ikincisi ikonun altında, üçüncüsü ise metinlerin üstünde.Bu sayede ikon ve metinler kutunun ortasında duruyor.

## 3.Liste sayfası
Bu sayfa klasik üstten aşşağı sıralanma çok sıradan geldiği için AI'dan farklı bir tasarım istedim ve sonuç olarak Asimetrik Bento Box düzeninde karar kıldım , farklı ve minimalist tarzımada uyduğunu düşündüğüm için güzel seçim olduğunu düşünüyorum.

**Hedef Kod**
  @override
  Widget build(BuildContext context) {
    final List<String> yetenekler = [
      "C#",
      "Java",
      "Python",
      "Web Editörlük",
      "Flutter",
      "3D Modelleme (Blender - Mesh Manipülasyonu)",
    ];

Bir string listesi tanımlayıp final ile sonradan değiştirilemez olarak sabitledim. 
List<String> → < > kısmı "generic" (tür belirteci). Bu liste sadece metin tutabilir dedik.İçeriğinde 6 yetenek ismi var. Bunlar daha sonra kutulara yazılacak ve detay sayfasına argüman olarak gönderilecek.

**Hedef Kod**
       body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

Sayfanın layout dediğimiz kısmını oluşturuyoruz.
center içeriği tam merkeze hizalar.
SingleChildScrollView ise sayfa içeriği ekranın altına taşarsa kaydırma özelliği ekler.
mainAxisSize: MainAxisSize.min ise dikey sütunun sadece ihtiyacı kadar yer kaplamasını sağlar.

**Hedef Kod**
              // 1. Satır: Asimetrik genişliklerde 3 kutu
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildYetenekKutusu(context, yetenekler[0], 0),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: _buildYetenekKutusu(context, yetenekler[1], 1),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 4,
                    child: _buildYetenekKutusu(context, yetenekler[2], 2),
                  ),
                ],
              ),

İlk satırımızı ele alıyoruz asimetri için flex değerlerini düzenledim.Flex genişlik oranlarını belirliyor.Daha sonra kutular arası 12 piksel boşluk ekledik 
_buildYetenekKutusu(...) metodu ile her kutu için ayrı ayrı kod yazmak yerine tek bir yerden yönettim.Bu sayede kod tekrarını önledim ve daha düzenli bir kod yapısı elde ettim.

**Hedef Kod**
  // Her yetenek için tıklanabilir kutu oluşturucu
  Widget _buildYetenekKutusu(BuildContext context, String metin, int index) {
    Color boxColor;
    BoxBorder? border;

_buildYetenekKutusu ile bu kısımda her yetenek kutusu için tıklanabilir bir yapı oluşturuyoruz.Bu sayede her kutuya tıklandığında detay sayfasına gidiyor.Ayrıca her kutunun rengini ve border'ını da burada belirledik.Önemli kısım ise

Widget _buildYetenekKutusu(...)  Private bir metot. Alt çizgi ile başlayanlar sadece bu dosya içinden erişilebilir.
3 parametre alır:
context → Tema rengine erişmek için
metin → Kutunun içindeki yetenek adı (ör. "C#")
index → Kutunun sırası (0'dan 5'e kadar). Hangi kutuya hangi renk/stil uygulanacağını belirlemek için.

**Hedef Kod**
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.blur_on,
              color: (index == 1 || index == 4) ? Colors.white : Colors.white54,
              size: 24,
            ),
            const Spacer(),
            Text(
              metin,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

burda kutunun iç düzeni oluşturuluyor.mainAxisAlignment: MainAxisAlignment.end ile kutunun içeriği en altta hizalanıyor.crossAxisAlignment: CrossAxisAlignment.start ile kutunun içeriği en solda hizalanıyor.Spacer() ise aradaki boşlukları doldurmak için kullanılıyor.Burada da 3 tane spacer kullandık.Birincisi ikonun üstünde, ikincisi ikonun altında, üçüncüsü ise metinlerin üstünde.Bu sayede ikon ve metinler kutunun ortasında duruyor.
Max line 3 kullanarakta en fazla 3 satır olablir dedik.Overflow: TextOverflow.ellipsis ilede 3 satırdan fazla olursa ... koyarak gösterir.

## 4.Detay Sayfası
Bu sayfa en kalabılık kısım ama 5 başlıkta incelersek karışıklığı azaltırız.

Switch case yapısı ile başlayalım.

**Hedef Kod**
    // Seçilen yeteneğe göre gövdeyi (body) değiştiren yapı
    Widget sayfaIcerigi;

    switch (secilenYetenek) {
      case "3D Modelleme (Blender - Mesh Manipülasyonu)":
        sayfaIcerigi = const BlenderVideoScreen();
        break;
      case "Web Editörlük":
        sayfaIcerigi = _buildWebEditorSayfasi(context);
        break;
      case "Python":
        sayfaIcerigi = const PythonLoomScreen();
        break;
      case "Flutter":
        sayfaIcerigi = _buildFlutterSayfasi(context);
        break;
      case "C#":
      case "Java":
      default:
        sayfaIcerigi = _buildVarsayilanSayfa(context, secilenYetenek);
        break;
    }

switch case bir değişkenin değerine göre farklı kodlar çalıştırıyor.if-else if zincirinin daha okunaklı hali
Secilenyetenek değişkenine göre 
3D Modelleme..." → BlenderVideoScreen() (arka planda video oynatan Stateful widget)

"Web Editörlük" → _buildWebEditorSayfasi() (scroll'lu metin + fotoğraf sayfası)

"Python" → PythonLoomScreen() (metin + 3 video kartı)

"Flutter" → _buildFlutterSayfasi() (sadece metin)

"C#", "Java" veya tanınmayan bir değer → _buildVarsayilanSayfa() (basit şablon sayfa)
 şeklinde kodlar çalıştırıyor.

case "C#": satırından sonra break; olmadan case "Java": geliyor yani C# ve Java aynı kodu çalıştırsın 
default hiçbir case eşleşmezse çalışacak.

**Hedef Kod**
    // Scaffold'u ortak tutup sadece içini değiştirelim
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          secilenYetenek.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
            fontSize: 15,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // Tüm kontrolü dinamik olarak sayfaIcerigi isimli widget'a bıraktık
      body: sayfaIcerigi,
    );
  }

  Scaffold ve AppBarı her yetenek için aynı sadece body kısmını değiştiriyoruz.
  secilenYetenek.toUpperCase() → Gelen metni büyük harfe çevirdik.
  body: sayfaIcerigi → Yukarıdaki switch ile belirlenen widget buraya yerleştirilir.
  Ve bu sayede AppBarı tekrar yazmadan ortak bir Scaffold kullanıp sadece body'i değiştirdik ve tekrarsız temiz bir kod elde ettik.

  **Hedef kod**

  Widget _buildWebEditorSayfasi(BuildContext context) {
    final ekranYuksekligi = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          // 1. BÖLÜM: Tam ekran merkezde metin
          SizedBox(
            height: ekranYuksekligi * 0.75,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "WEB EDİTÖRLÜK",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: const Text(
                      "Web geliştirme ve editörlüğünde html , css , javascript temel düzeyde tecrübem bulunmakta.\n...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.6,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


MediaQuery.of(context).size.height farklı cihazlara uyum sağlamak için ekranın yüksekliğini alıyoruz.Farklı cihazlarda farklı değerler döner.
SingleChildScrollView → Tüm sayfayı kaydırılabilir yapar.
SizedBox(height: ekranYuksekligi * 0.75) → Ekranın %75'i kadar yükseklikte bir alan. Başlık ve açıklama metni bu alanın tam ortasında durur (Center widget'ı sayesinde).
Artık kullanıcı sayfada önce yazdığım açıklamayı merak ederse altta ki içeriklerimi görücek ve detay sayfası estetik bir görünüm kazanıcak

**Hedef Kod**
          // 2. BÖLÜM: Fotoğraflar (aşağı kaydırınca görünür)
          SizedBox(
            height: 400,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A0A0A),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(23),
                      child: Image.asset(
                        'asset/Assets-Web.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A0A0A),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(23),
                      child: Image.asset(
                        'asset/Asset-web-hakkimizda.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),

Fotoğraflar için 2 tane container kullandık.
ikside aynı zaten.
SizedBox(height: 400)  400 piksel yüksekliğinde.
İki fotoğraf Row ile yan yana. Her biri Expanded ile eşit genişlikte ve ClipRRect köşeleri yuvarlanmış bölgeler oluşturduk.
Image.asset('asset/Assets-Web.png', ...) asset klasöründen içeriği çektik
fit: BoxFit.contain  Fotoğrafı kırpmadan, oranını koruyarak kutuya sığdırır. BoxFit.cover kırpar, .contain kırpmaz.

**Hedef Kod**
  Widget _buildFlutterSayfasi(BuildContext context) {
    final ekranYuksekligi = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          SizedBox(
            height: ekranYuksekligi * 0.75,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("FLUTTER", ...),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(...),
                    child: const Text(
                      "Şu an tam da içinde bulunduğunuz bu portfolyo uygulaması Flutter ile geliştirilmiştir.\n...",
                      ...
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

Web Editörlük sayfasıyla aynı düzen, ama fotoğraf bölümü yok — sadece metin.
Ekranın %75'inde ortalanmış başlık + açıklama kutusu. Yapısı aynen aynı olduğu için burda da tekrar bir tasarım tutarlılığı sağlanmış oldu.

**Hedef Kod**
  Widget _buildVarsayilanSayfa(BuildContext context, String baslik) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.terminal, size: 60, color: Colors.blueGrey[300]),
              const SizedBox(height: 20),
              Text(
                "$baslik Temelleri",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Bu yetenek envanterime yeni eklenmekte olup kendimi bu yetenekte geliştirmeye devam ediyorum.  Şimdilik eklenecek bir projem yok.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
 
 C# ve Java gibi henüz detaylı içeriğimin  olmadığı  yetenekler için şablon sayfa.
 
 "$baslik Temelleri" → String interpolation yaparak metin içine değişken gömdük.Yani baslik = "C#" ise sonuç: "C# Temelleri" olucak.

  **Hedef Kod**
  class BlenderVideoScreen extends StatefulWidget {
  const BlenderVideoScreen({super.key});

  @override
  State<BlenderVideoScreen> createState() => _BlenderVideoScreenState();
}

Bu kısımda dinamik bir değişken var olduğundan StatefulWidget kullandık. Videonun yüklenme durumu, oynatılma durumu gibi şeyler zamanla değiştiği için Stateful şart.
createState() Her StatefulWidget'ın bir State nesnesi olmalı. Bu metot onu oluşturur.

**Hedef Kod**
class _BlenderVideoScreenState extends State<BlenderVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('asset/assets-render.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0.0); // Sesini tamamen kapat
        _controller.setLooping(true); // Sürekli başa sarsın
        _controller.play(); // Hemen başlasın
        setState(() {}); // Ekranı güncelle
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Sayfa kapanınca RAM'i boşalt
    super.dispose();
  }

Videoyu sayfada sorunsuz çalıştırabilmek için bazı hazırlık ve temizlik aşamalarına ihtiyacımız var. Bu kısımları yönetmek için belli fonksiyonlar kullandım:

- **VideoPlayerController _controller:** Bu aslında bizim videomuzun kumandası. Başlatma, durdurma, sessize alma gibi tüm işlemleri bunun üzerinden yapıyoruz.

- **initState() & initialize():** Bu kısım sayfa açıldığı anda bir kere çalışan hazırlık evresi. Önce `VideoPlayerController.asset` ile oynatacağım videonun dosya yolunu gösterdim ve `.initialize()` ile videoyu yüklemeye başladım. 

- **Otomatik Ayarlar (Volume, Looping, Play):** Videonun tasarımın arkasında sessizce dönüp durmasını istediğim için `setVolume(0.0)` ile sesini tamamen kıstım. `setLooping(true)` ile video bittikçe başa sarmasını sağladım ve doğrudan `play()` komutunu verdim.

- **setState(() {}):** Video dosyası büyük olduğu için yüklenmesi zaman alıyor. Video hazır olduğunda `setState` komutunu kullanarak Flutter'a "Haberin olsun, video yüklendi ekranı yenileyip videoyu oynatmaya başla" demiş oldum. Eğer bunu demezsek arkada video başlar ama ekranda simsiyah bir ekran görürüz.

- **dispose():** Geliştirmede dikkat ettiğim en önemli detaylardan biri de bu oldu. Kullanıcı bu sayfadan çıkıp başka yere gittiğinde videonun arka planda çalışıp telefonu kastırmaması (RAM sızıntısı yapmaması) gerekiyor. Bu yüzden `dispose()` kullanarak sayfa kapatıldığı an _controller'ı yok ettim ve hafızayı temizledim.

**Hedef Kod**
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // GERÇEK ARKA PLAN VİDEOSU
        Positioned.fill(
          child: Container(
            color: const Color(0xFF1A1A1A),
            child: _controller.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Colors.white24),
                  ),
          ),
        ),
        // Karanlıklaştırma filtresi
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.5))),
        // EKRANIN TAM ORTASINDAKİ YAZI ALANI
        Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "BLENDER RENDER\nPROJESİ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 3),
                ),
                const SizedBox(height: 20),
                Text(
                  "Blender 3D modelleme , animasyon ve render yetenklerim...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[300], height: 1.6),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

arka plana video yerleştirmek istedğimden 
Stack Widget'ları üst üste koyar. Tıpkı Photoshop katmanları gibi. En alttaki çocuk en arkada, son çocuk en önde.
1. Katman: Video
Positioned.fill → Stack'in tüm alanını kapla. Video arka plan olarak tam ekran yayılır.
_controller.value.isInitialized → Video yüklendi mi? Ternary operator ile kontrol:
Evet → FittedBox(fit: BoxFit.cover, ...) ile videoyu ekranı tamamen kaplayacak şekilde göster (bazı kenarlar kırpılabilir).
Hayır → CircularProgressIndicator ile yükleniyor animasyonu göster (dönen çember).
SizedBox(width: ..., height: ...) → Videonun orijinal boyutlarında bir kutu. FittedBox bunu ekrana göre ölçeklendirir.
2. Katman: Karanlıklaştırma filtresi
Container(color: Colors.black.withOpacity(0.5)) → Videonun üstüne %50 siyah bir örtü. Böylece alttaki yazılar okunaklı olur. Sinema afişi etkisi.
3. Katman: Yazı alanı
Center + Column(mainAxisSize: MainAxisSize.min) → Yazılar ekranın tam ortasında.
Başlık + açıklama metni.

**Hedef Kod**
class PythonLoomScreen extends StatelessWidget {
  const PythonLoomScreen({super.key});

  static const List<String> videoBasliklari = [
    'Python Temelleri',
    'Tahmin Oyunu',
    'Web Kazıma',
  ];

  @override
  Widget build(BuildContext context) {
    final ekranYuksekligi = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: ekranYuksekligi * 0.75,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("PYTHON\nPROJELERİ", ...),
                  const SizedBox(height: 24),
                  Container(
                    ...
                    child: const Text(
                      "Python yeteneklerim de diğer yeteneklerim gibi temel düzeydedir.\n...",
                      ...
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 420,
            child: Row(
              children: [
                Expanded(child: LoomVideoOynatici(videoIndex: 0, baslik: videoBasliklari[0])),
                const SizedBox(width: 20),
                Expanded(child: LoomVideoOynatici(videoIndex: 1, baslik: videoBasliklari[1])),
                const SizedBox(width: 20),
                Expanded(child: LoomVideoOynatici(videoIndex: 2, baslik: videoBasliklari[2])),
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

PythonLoomScreen → StatelessWidget. "Ama video oynatıyorsak neden Stateless?" Çünkü bu widget sadece düzeni kuruyor. Asıl video oynatma işini LoomVideoOynatici adlı ayrı bir StatefulWidget yapıyor.
static const List<String> videoBasliklari → Her videonun başlığı. 
static = sınıfın kendisine ait, nesneye değil. const = sabit, değiştirilemez.
Web Editörlük sayfasıyla aynı "scroll reveal" mantığı
ayrıca her video kartı LoomVideoOynatici widget'ı.
 videoIndex ile hangi video dosyası, baslik ile alt kısımdaki etiket belirleniyor.
 

**Hedef kod**
class LoomVideoOynatici extends StatefulWidget {
  final int videoIndex;
  final String baslik;
  const LoomVideoOynatici({
    super.key,
    required this.videoIndex,
    required this.baslik,
  });

  static const List<String> videoYollari = [
    'asset/v1.mp4',
    'asset/v2.mp4',
    'asset/v3.mp4',
  ];

  @override
  State<LoomVideoOynatici> createState() => _LoomVideoOynaticiState();
}

final int videoIndex ve final String baslik  bunlar dışarıdan gelen parametreler.
required = Bu parametreleri vermeden widget oluşturamazsın.
final = Bir kere atandıktan sonra değiştirilemez demekti.
static const List<String> videoYollari → 3 videonun dosya yolları. 
videoIndex ile doğru dosyaya erişilir.
videoYollari[0] = 'asset/v1.mp4', videoYollari[1] = 'asset/v2.mp4', gibi.

**Hedef Kod**
class _LoomVideoOynaticiState extends State<LoomVideoOynatici> {
  late VideoPlayerController _controller;
  bool _isOynuyor = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset(
            LoomVideoOynatici.videoYollari[widget.videoIndex],
          )
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _videoyuTetikle() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      setState(() {
        _isOynuyor = false;
      });
    } else {
      _controller.play();
      setState(() {
        _isOynuyor = true;
      });
    }
  }

bool _isOynuyor = false Videonun şu an oynayıp oynamadığını takip eder.
Başlangıçta false = video durmuş halde başlar.
widget.videoIndex → StatefulWidget'teki videoIndex parametresine State sınıfından widget. ile erişilir.
LoomVideoOynatici.videoYollari[widget.videoIndex] Doğru video dosyasının yolunu alır.
initialize() → Blender'daki gibi ama burada otomatik oynatma yok. Sadece hazırla ve ekranı güncelle.
_videoyuTetikle() → Video oynatma/duraklatma toggle fonksiyonu.
Oynuyorsa → pause() ile durdur, _isOynuyor = false yap.
Duruyorsa → play() ile oynat, _isOynuyor = true yap.
Her ikisinde de setState() çağırarak ekranı günceller play butonu görünüp kaybolsun.

**Hedef K0d**
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Stack(
          fit: StackFit.expand,
          children: [

boxShadow kutunun altına gölge
blurRadius: 20 →Gölgenin bulanıklık mesafesi ve 
offset: Offset(0, 8) ilede aşağı doğru 8 piksel kayması sağlandı

**Hedef Kod**
                     // Alt gradient (başlık bandı)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                  ),
                ),
              ),
            ),
  
Positioned → Stack içinde widget'ı kesin bir konuma yerleştirmek için. bottom: 0, left: 0, right: 0 = kutunun alt kenarına yapışık, genişliğin tamamını kapla.
LinearGradient → Doğrusal renk geçişi. Alttan üste doğru siyahtan şeffafa geçiş.
bottomCenter → topCenter = aşağıdan yukarıya
Colors.black.withOpacity(0.9) → Altı neredeyse tam siyah
Colors.transparent → Üstü tamamen şeffaf
video kartının alt kısmındaki başlık yazısına görsellik kattık.

**Hedef Kod**
            // PLAY BUTONU (sadece durduğunda)
            if (!_isOynuyor && _controller.value.isInitialized)
              Center(
                child: GestureDetector(
                  onTap: _videoyuTetikle,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white38, width: 2),
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),


f (!_isOynuyor && _controller.value.isInitialized) → Dart'ta collection if kullanımı. Bu widget, sadece video durmuşken VE video hazır olduğunda ekranda görünür. Video oynarken play butonu kaybolur.
BoxShape.circle → Container'ı daire şeklinde yap. Play butonlarının geleneksel görünümü.
Colors.black.withOpacity(0.6) → Yarı saydam siyah arka plan. Videonun üstünde göze batar ama tamamen kaplamaz.
Icons.play_arrow_rounded → Yuvarlak köşeli play (oynat) ikonu.

**Hedef KOd**
            // Sol üst numara rozeti
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '${widget.videoIndex + 1}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

'${widget.videoIndex + 1}' → Index 0'dan başlar ama kullanıcıya 1, 2, 3 gösterelim. Bu yüzden +1.
Siyah metin beyaz arka plan üstünde → Kontrast rozet.

**Hedef Kod**
            // Alt başlık
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Text(
                widget.baslik,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

widget.baslik → Dışarıdan gelen başlık metni (ör. "Python Temelleri").
letterSpacing: 0.5 → Çok hafif harf aralığı. Okunabilirliği artırır.
fontWeight: FontWeight.w800 → ExtraBold. Gradient arka plan üstünde kalın yazı daha iyi okunur.

Ve işte bu kadar projemiz bitti.Bu projede flutterda Layout ve widget yapısını öğrendim.
Bu yetkinlikleri geliştirmekte olduğum diğer flutter uygulamamda da kullanacağım.
 Son olarak bir hatırlama: Projemin büyük kısmında AI kullanığımı raporumda da yardım aldığımı ancak bu yardımların başı boş olmadığı tekrar belirtmek istiyorum.

Raporumu uygulamadan bazı ekran görüntüleri ile sonlandrırıyorum 

TEŞEKKÜR EDERİM.