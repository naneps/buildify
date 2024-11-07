import 'package:buildify/app/commons/ui/overlays/x_snackbar.dart';
import 'package:buildify/app/services/firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authService = Get.put<FirebaseAuthService>(FirebaseAuthService());
  final TextEditingController emailController = TextEditingController();

  void signInAnonymously() {
    authService.signInAnonymously();
  }

  void signInWithEmailLink(String email) {
    authService.registerWithEmailOnly(email);
  }

  void signWithGitHub() {
    authService.signInWithGitHub(onSuccess: () {
      Get.back();
      XSnackBar.show(
        context: Get.context!,
        message: "Signed in successfully",
        type: SnackBarType.success,
      );
    }, onFail: () {
      Get.back();
      XSnackBar.show(
        context: Get.context!,
        message: "Failed to sign in",
        type: SnackBarType.error,
      );
    });
  }
}
