import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '/app/models/user.model.dart';
import '/app/models/user_gradient.model.dart';
import '/app/repositories/gradient.repository.dart';
import '/app/services/user_service.dart';

class UserGradientCardController extends GetxController {
  final gradientRepo = Get.find<GradientRepository>();
  final userService = Get.find<UserService>();
  UserGradientModel? userGradient;
  RxBool isLoading = true.obs;
  Rx<UserModel?> user = Rx<UserModel?>(null);
  UserGradientCardController({this.userGradient});

  Future<UserModel> fetchUser(String userId) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userGradient!.userId)
        .get();
    if (!docSnapshot.exists) {
      throw Exception('User not found');
    }
    return UserModel.fromFirestore(docSnapshot.data()!, docSnapshot.id);
  }

  void getUser() async {
    user.value = await fetchUser(userService.uid);
    isLoading.value = false;
  }

  void likeGradient() async {
    try {
      print(userGradient!.id!);
      await gradientRepo.onLikeGradient(userGradient!.id!);
      update();
    } catch (e) {
      print("Error liking gradient: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  void saveGradient() async {
    await gradientRepo.saveGradient(userGradient!.id!);
    update();
  }
}
