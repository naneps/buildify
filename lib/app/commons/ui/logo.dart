import 'package:buildify/app/commons/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logo extends StatelessWidget {
  final double? fontSize;
  const Logo({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: ThemeManager().scaffoldBackgroundColor,
        boxShadow: const [],
        border: ThemeManager().defaultBorder(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text.rich(
        TextSpan(
          text: "",
          style: Get.textTheme.displayLarge!,
          children: [
            WidgetSpan(
              child: Image.asset(
                'assets/images/buildify-icon.png',
                height: 25,
                width: 25,
                fit: BoxFit.contain,
              ),
            ),
            TextSpan(
              text: ' Build',
              style: Get.textTheme.labelLarge!.copyWith(
                color: ThemeManager().blackColor,
                height: 1.3,
                fontFamily: 'Poppins',
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: fontSize ?? 20,
              ),
            ),
            TextSpan(
              text: 'ify',
              style: Get.textTheme.labelLarge!.copyWith(
                color: ThemeManager().primaryColor,
                fontFamily: 'Poppins',
                fontSize: fontSize ?? 20,
                height: 1.3,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
