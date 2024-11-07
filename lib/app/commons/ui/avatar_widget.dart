import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/models/user.model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: ThemeManager().successColor,
      child: CircleAvatar(
        backgroundColor: ThemeManager().tertiaryColor,
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
              baseColor: ThemeManager().secondaryColor,
              highlightColor: ThemeManager().primaryColor,
              child: const CircleAvatar()),
          errorWidget: (context, url, error) => CachedNetworkImage(
            imageUrl: "https://avatar.iran.liara.run/public",
          ),
        ),
      ),
    );
  }
}
