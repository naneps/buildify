import 'package:buildify/app/services/firebase/firebase_auth_service.dart';
import 'package:buildify/app/services/user_service.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut(() => FirebaseAuthService());
    Get.lazyPut(() => UserService());
  }
}
