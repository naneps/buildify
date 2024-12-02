import 'package:buildify/app/commons/themes/app_theems.dart';
import 'package:buildify/app/routes/app_pages.dart';
import 'package:buildify/app/services/firebase/crashlytics_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Buildify App",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => CrashlyticsService());
      }),
      getPages: AppPages.routes,
      onInit: () {},
    );
  }
}
