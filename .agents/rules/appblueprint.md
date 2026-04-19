---
trigger: always_on
---

# Proje Mimarı: DevStack Portfolyo (app_blueprint.md)

## 1. Tasarım Dili (UI/UX)
- **Tema:** Kesinlikle Dark Mode.
- **Renk Paleti:** Siyah (Arka plan), Beyaz (Metinler), ve çok koyu gri tonları (Kartlar ve ayırıcılar). Renkli buton veya ikon kullanılmayacak, şık ve minimal bir monokrom estetik sağlanacak.
- **Düzen:** Apple tarzı asimetrik "Bento Box" tasarımı (farklı boyutlarda kenarları yuvarlatılmış kutular). Padding ve margin değerleri tutarlı ve ferah olacak.

## 2. Proje Yapısı ve Rotalar (Routing)
- Çoklu sayfa yapısı `Navigator.pushNamed` ve `Navigator.pop` ile yönetilecek.
- `/` (Ana Sayfa): Bento box düzeninde profil özeti.
- `/skills` (Liste Sayfası): Yeteneklerin ListView ile listelendiği sayfa.
- `/detail` (Detay Sayfası): Seçilen yeteneğin detaylarını gösteren sayfa.

## 3. Statik Veri Seti (Kullanılacak Yetenekler)
- Yazılım: C#, Java, Python, SQL, Flutter
- Tasarım: 3D Modelleme (Blender - Mesh Manipülasyonu)
- *Not: Agent bu yetenekler haricinde hayali veri veya placeholder kullanmayacaktır.*

## 4. Teknik Sınırlar
- Sadece standart Flutter widget'ları kullanılacak (Scaffold, AppBar, Container, Column, Row, ListView, Image, Text).
- Harici paket (pub.dev) veya API kullanılmayacak. Veriler statik liste veya map (sözlük) yapılarıyla tutulacak.