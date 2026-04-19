import 'package:flutter/material.dart';

class ListeSayfasi extends StatelessWidget {
  const ListeSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    // Proje kurallarındaki statik veri seti
    final List<String> yetenekler = [
      "C#",
      "Java",
      "Python",
      "SQL",
      "Flutter",
      "3D Modelleme (Blender - Mesh Manipülasyonu)",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Yeteneklerim"), centerTitle: true),
      // Alt alta listeleme işlemi için ListView seçildi
      body: ListView.builder(
        itemCount: yetenekler.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  yetenekler[index],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onTap: () {
                  // 4. Adımın veri taşıma işlemi: '/detail' rotasına giderken yetenek metnini gönderiyoruz
                  Navigator.pushNamed(
                    context, 
                    '/detail', 
                    arguments: yetenekler[index],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
