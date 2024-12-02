import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/models/user.model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class AvatarWidget extends StatelessWidget {
  final UserModel user;
  double? radius;
  AvatarWidget({
    super.key,
    required this.user,
    this.radius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: MainColors.successColor,
      child: CircleAvatar(
        backgroundColor: MainColors.tertiaryColor,
        radius: radius! - 4,
        child: CachedNetworkImage(
          imageUrl: user.avatar ?? "",
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              user.avatar!,
            ),
            radius: 12,
          ),
          placeholder: (context, url) => Shimmer.fromColors(
              baseColor: MainColors.secondaryColor,
              highlightColor: Get.theme.primaryColor,
              child: const CircleAvatar()),
          errorWidget: (context, url, error) => CachedNetworkImage(
            imageUrl: "https://avatar.iran.liara.run/public",
          ),
        ),
      ),
    );
  }
}
