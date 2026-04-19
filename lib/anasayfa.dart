import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Üst büyük kutu: Kişisel bilgi
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

            const SizedBox(height: 16),

            // Alt kısım: Asimetrik Bento grid
            Expanded(
              child: Row(
                children: [
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

                  const SizedBox(width: 16),

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
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
