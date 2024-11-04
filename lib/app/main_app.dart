import 'package:buildify/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Buildify App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
