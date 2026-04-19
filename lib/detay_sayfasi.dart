import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetaySayfasi extends StatelessWidget {
  const DetaySayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste Sayfasından gelen veriyi yakalıyoruz (Argüman Yakalama)
    final String secilenYetenek =
        ModalRoute.of(context)!.settings.arguments as String;

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

    // Scaffold'u ortak tutup sadace içini değiştirelim
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

  // ----------------------------------------------------
  // STATİK (VİDEOSUZ) OLAN SAYFALARIN METOTLARI
  // ----------------------------------------------------

  // WEB EDİTÖRLÜK (Scroll: İlk ekran metin, aşağı kay fotoğraflar)
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
                      "Web geliştirme ve editörlüğünde html , css , javascript temel düzeyde tecrübem bulunmakta.\nÜniversitede aldığım dersler ve bu dersler doğrultusunda geliştirdiğim projeler bu tecrübeleri elde etmemi sağladı.\nİşte hala üzerinde çalıştığım mobil tarafını ise Flutter ile geliştirdiğim Github Analizörü projemin web sayfasından birkaç örnek görsel:",
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
        ],
      ),
    );
  }

  // FLUTTER (Scroll: Sadece metin, görsel yok)
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
                  const Text(
                    "FLUTTER",
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
                      "Şu an tam da içinde bulunduğunuz bu portfolyo uygulaması Flutter ile geliştirilmiştir.\nProjeyi kendiniz deneyimleyebilir yetkinliklerim hakkında bilgi sahibi olabilirsiniz.\nGithub'da paylaştığım bir diğer flutter çalışmam olan Github Analizörü'ne de göz atabilirsiniz.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.6,
                        color: Colors.white,
                      ),
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

  // C# VE JAVA İÇİN VARSAYILAN SAYFA (Basit olanlar)
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
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Bu yetenek envanterime yeni eklenmekte olup kendimi bu yetenekte geliştirmeye devam ediyorum.  Şimdilik eklenecek bir projem yok.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------------------
// VİDEO OYNATMA (STATEFUL) BÖLÜMLERİ
// (Paket kuralları yıkıldı: video_player devrede!)
// ----------------------------------------------------

// 1. BLENDER (Arka Planda Render, Ortada Yazı)
class BlenderVideoScreen extends StatefulWidget {
  const BlenderVideoScreen({super.key});

  @override
  State<BlenderVideoScreen> createState() => _BlenderVideoScreenState();
}

class _BlenderVideoScreenState extends State<BlenderVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('asset/assets-render.mp4')
      ..initialize().then((_) {
        // Video yüklendiğinde arka plan modu için gerekli ayarlar
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // GERÇEK ARKA PLAN VİDEOSU
        Positioned.fill(
          child: Container(
            color: const Color(0xFF1A1A1A), // Yüklenirken duracak renk
            child: _controller.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover, // Videoyu ekranın tamamına yayar
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
        // Karanlıklaştırma filtresi (Hareketli videonun üstündeki yazının okunması için siyah tül)
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.5))),
        // EKRANIN TAM ORTASINDAKİ YAZI ALANI
        Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ortaya hizalamak için gerekli
              children: [
                const Text(
                  "BLENDER RENDER\nPROJESİ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Blender 3D modelleme , animasyon ve render yetenklerim basit işler için yeterli düzeyde arka planda oynayan video bir grup çalışması ürünüdür.\n Videoda ki güneş,bulutlar,ışıklandırmalar,hazır alınan yer şekillerinin düzenlemesi ve animasyonların tamamı son olarak render kısmıda bana aittir \n ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[300],
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 2. PYTHON (Scroll: İlk ekran metin, altta 3 video yan yana)
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
          // 1. BÖLÜM: Tam ekran merkezde metin
          SizedBox(
            height: ekranYuksekligi * 0.75,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "PYTHON\nPROJELERİ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: const Text(
                      "Python yeteneklerim de diğer yeteneklerim gibi temel düzeydedir.\nİşte loom üzerinden kaydettiğim bir kaç Python alıştırma videosu:",
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.6,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 2. BÖLÜM: Videolar
          SizedBox(
            height: 420,
            child: Row(
              children: [
                Expanded(
                  child: LoomVideoOynatici(
                    videoIndex: 0,
                    baslik: videoBasliklari[0],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: LoomVideoOynatici(
                    videoIndex: 1,
                    baslik: videoBasliklari[1],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: LoomVideoOynatici(
                    videoIndex: 2,
                    baslik: videoBasliklari[2],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

// Her bir Python Loom videosunu bağımsız çalıştırmak için kendi StatefulWidget kutusu
class LoomVideoOynatici extends StatefulWidget {
  final int videoIndex;
  final String baslik;
  const LoomVideoOynatici({
    super.key,
    required this.videoIndex,
    required this.baslik,
  });

  // Her bir Loom videosunun gerçek dosya yolları
  static const List<String> videoYollari = [
    'asset/v1.mp4',
    'asset/v2.mp4',
    'asset/v3.mp4',
  ];

  @override
  State<LoomVideoOynatici> createState() => _LoomVideoOynaticiState();
}

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
            // GERÇEK VİDEO EKRANI
            _controller.value.isInitialized
                ? GestureDetector(
                    onTap: _videoyuTetikle,
                    child: FittedBox(
                      fit:
                          BoxFit.contain, // Videonun tamamını gösterir, kırpmaz
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Colors.white24),
                  ),

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
