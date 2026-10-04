# SekaliPay Clone

Reconstruction project berdasarkan inspeksi statis terhadap APK `SekaliPay_1.0.15.apks` yang diberikan di percakapan.

## Temuan utama dari APK

- Framework: Flutter (terdapat `assets/flutter_assets`, `libapp.so`, dan package Dart).
- Package aplikasi: `com.sekalipay.mobile`.
- Arsitektur terindikasi: Riverpod + GoRouter + Dio + Drift/SQLite + Flutter Secure Storage.
- Integrasi: Firebase Core/Messaging, Google Sign-In, Local Auth/Biometrics, WebView, Image Picker, Geolocator, QR.
- Modul utama: auth/OTP/PIN, saldo & top up, katalog produk, transfer, QR, order/history, points/redeem, merchant, disbursement bank/e-wallet, notifications, devices, profile/settings.
- API base yang tertanam pada aplikasi asli: `https://sekalipay.com/api/mobile`.

## Catatan legal & keamanan

Project ini adalah implementasi ulang (clean-room reconstruction), bukan salinan source code Dart asli. Jangan gunakan endpoint, token, Firebase credentials, certificate pins, atau kredensial milik pihak lain untuk produksi tanpa otorisasi.

## Setup

1. Install Flutter stable.
2. Jalankan `flutter pub get`.
3. Salin `lib/core/config/app_config.dart.example` menjadi `app_config.dart` bila ingin mengubah API base URL.
4. Jalankan `flutter run`.

Aplikasi default berjalan dalam **demo mode** sehingga UI dapat diuji tanpa backend.

## Backend contract

`lib/core/network/api_client.dart` memuat mapping endpoint yang teramati pada APK untuk memudahkan backend milik sendiri. Implementasi demo memakai data lokal; ganti `DemoRepository` dengan repository API untuk produksi.
