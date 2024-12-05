import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/border_radius.model.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/box_shadow.model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/builder_models/decoration_image.model.dart';
import 'package:buildify/app/models/button_models/icon_button.model.dart';
import 'package:buildify/app/models/circle_avatar_models/circle_avatar.model.dart';
import 'package:buildify/app/models/flex_models/column.model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/image_provider_model/image_provider.model.dart';
import 'package:buildify/app/models/listile_models/listile.model.dart';
import 'package:buildify/app/models/text_models/font_weight.model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:buildify/app/models/user_widget.model.dart';
import 'package:buildify/app/models/widget_models/expanded.model.dart';
import 'package:buildify/app/models/widget_models/icon_model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:buildify/app/repositories/widget.repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WidgetBuilderController extends GetxController {
  final repo = Get.find<WidgetRepository>();
  Rx<WidgetModel> widget = ContainerModel(
    width: RxDouble(300),
    height: RxDouble(200),
    padding: EdgeInsetModel.all(10),
    decoration: BoxDecorationModel(
        color: const Color.fromARGB(255, 233, 233, 233),
        border: BorderModel(
          type: BorderType.all,
          all: BorderSideModel(width: 2, color: Colors.grey.shade300),
        ),
        borderRadius: BorderRadiusModel(all: 20),
        boxShadow: [
          BoxShadowModel(
            blurRadius: 20,
            color: Colors.black,
            offset: const Offset(10, 5),
            spreadRadius: 2,
          )
        ]
        //   boxShape: BoxShape.circle,
        ),
    child: ColumnModel(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpandedModel(
          child: ContainerModel(
            decoration: BoxDecorationModel(
              borderRadius: BorderRadiusModel(all: 15),
              image: DecorationImageModel(
                image: ImageProviderModel(
                  pathImage:
                      'https://images.unsplash.com/photo-1733235014318-6e8108f50510?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNnx8fGVufDB8fHx8fA%3D%3D',
                  type: ImageProviderType.network,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ListTileModel(
          leading: CircleAvatarModel(
            radius: 20,
            backgroundImage: ImageProviderModel(
              pathImage: 'https://avatars.githubusercontent.com/u/72372613?v=4',
              type: ImageProviderType.network,
            ),
          ),
          title: TextModel(
              text: 'Ahmed Mohamed',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleModel(
                color: Colors.black,
                fontSize: 16,
                fontWeight: XFontWeight.w600,
              )),
          subtitle: TextModel(
            text: 'Flutter Developer',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleModel(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: XFontWeight.w600,
            ),
          ),
          trailing: IconButtonModel(
            icon: IconModel(icon: MdiIcons.dotsVertical),
            iconSize: 20,
            padding: EdgeInsetModel.all(5),
            color: Colors.blueAccent,
          ),
        )
      ],
    ),
  ).obs;
  Future<List<UserWidgetModel>> getWidgets() async {
    return await repo.getWidgets();
  }

  void saveWidget() async {
    try {
      await repo.createWidget(UserWidgetModel(
        className: widget.value.runtimeType.toString(),
        name: 'Example Widget',
        description: 'description',
        widget: widget.value,
        userId: '',
      ));
    } catch (e) {
      print("Error creating widget: $e");
    }
  }

  Stream<List<UserWidgetModel>> streamWidgets() async* {
    yield* repo.streamWidgets();
  }
}
