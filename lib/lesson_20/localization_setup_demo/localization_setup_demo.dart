//! Cài đặt đa ngôn ngữ (localization) trong Flutter cho phép ứng dụng của bạn hỗ trợ nhiều ngôn ngữ khác nhau,
//! từ đó cải thiện trải nghiệm người dùng trên toàn cầu

//! Bước 1: Thêm Các Thư Viện Cần Thiết
//? Trước tiên, bạn cần thêm các gói cần thiết vào file pubspec.yaml

// dependencies:
//   flutter:
//     sdk: flutter
//   flutter_localizations:
//     sdk: flutter
//   intl: ^0.17.0

//? Trong đó:
// flutter_localizations: Hỗ trợ Flutter với các ngôn ngữ khác nhau.
// intl: Hỗ trợ việc định dạng ngày tháng, số và các hoạt động quốc tế hóa khác.

//! Bước 2: Cấu Hình Ứng Dụng
//? Cập nhật file lib/main.dart để thêm hỗ trợ đa ngôn ngữ

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_learning/l10n/generated/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Localization',
      //! chỉ định Ngôn ngữ cho app
      //? Dùng cho TH hệ thống đã lưu lại ngôn ngữ mà user đã chọn để sử dụng trong app
      locale: const Locale('vi'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == deviceLocale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.helloVTI),
      ),
    );
  }
}
