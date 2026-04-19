import 'package:flutter/material.dart';

class ListeSayfasi extends StatelessWidget {
  const ListeSayfasi({super.key});

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

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "YETENEKLERİM",
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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

              const SizedBox(height: 12),

              // 2. Satır: 1. satırın çapraz simetrisi
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: _buildYetenekKutusu(context, yetenekler[3], 3),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: _buildYetenekKutusu(context, yetenekler[4], 4),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 6,
                    child: _buildYetenekKutusu(context, yetenekler[5], 5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Her yetenek için tıklanabilir kutu oluşturucu
  Widget _buildYetenekKutusu(BuildContext context, String metin, int index) {
    Color boxColor;
    BoxBorder? border;

    // Asimetrik stil: Uçlar koyu, ortalar şeffaf kenarlıklı, geri kalanı gri
    if (index == 0 || index == 5) {
      boxColor = Theme.of(context).cardColor;
    } else if (index == 1 || index == 4) {
      boxColor = Colors.transparent;
      border = Border.all(color: Colors.white24, width: 1.5);
    } else {
      boxColor = const Color(0xFF181818);
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: metin);
      },
      child: Container(
        height: 140.0,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: boxColor,
          border: border,
          borderRadius: BorderRadius.circular(24),
        ),
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
      ),
    );
  }
}
