import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/models/builder_models/border_radius.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorderRadiusTool extends GetView<BorderRadiusToolController> {
  final Function(BorderRadiusModel)? onChange;
  final BorderRadiusModel? initValue;
  const BorderRadiusTool({
    super.key,
    required this.onChange,
    required this.initValue,
  });

  @override
  get controller =>
      Get.put(BorderRadiusToolController(Rx(initValue ?? BorderRadiusModel())),
          tag: key.toString());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Border Radius",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...BorderRadiusType.values.map((e) {
                    return Tooltip(
                      message: e.name,
                      verticalOffset: -50,
                      padding: const EdgeInsets.all(5),
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.borderRadius.value.type = e;
                          controller.borderRadius.refresh();
                          onChange!(controller.borderRadius.value);
                        },
                        child: Icon(
                          e.icon,
                          color: e == controller.borderRadius.value.type
                              ? MainColors.primaryColor
                              : Colors.grey,
                          size: 18,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (controller.borderRadius.value.type == BorderRadiusType.all) ...[
            SizedBox(
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("All"),
                ),
                initialValue:
                    controller.borderRadius.value.all?.toInt().toString(),
                onChanged: (value) {
                  controller.borderRadius.value.all =
                      double.tryParse(value) ?? 0;
                  onChange!(controller.borderRadius.value);
                },
              ),
            )
          ] else if (controller.borderRadius.value.type ==
              BorderRadiusType.only) ...[
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("TL")),
                    initialValue: controller.borderRadius.value.topLeft
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.borderRadius.value.topLeft =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.borderRadius.value);
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("TR"),
                    ),
                    initialValue: controller.borderRadius.value.topRight
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.borderRadius.value.topRight =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.borderRadius.value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("BL"),
                    ),
                    initialValue: controller.borderRadius.value.bottomLeft
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.borderRadius.value.bottomLeft =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.borderRadius.value);
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("BR"),
                    ),
                    initialValue: controller.borderRadius.value.bottomRight
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.borderRadius.value.bottomRight =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.borderRadius.value);
                    },
                  ),
                ),
              ],
            ),
          ] else if (controller.borderRadius.value.type ==
              BorderRadiusType.horizontal) ...[
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("horizontal left"),
                    ),
                    initialValue: controller.borderRadius.value.horizontalLeft
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.borderRadius.value.horizontalLeft =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.borderRadius.value);
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("horizontal right"),
                    ),
                    initialValue: controller.borderRadius.value.horizontalRight
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.borderRadius.value.horizontalRight =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.borderRadius.value);
                    },
                  ),
                ),
              ],
            ),
          ] else if (controller.borderRadius.value.type ==
              BorderRadiusType.vertical) ...[
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Vertical top"),
                    ),
                    initialValue: controller.borderRadius.value.verticalTop
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.borderRadius.value.verticalTop =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.borderRadius.value);
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Vertical bottom"),
                    ),
                    initialValue: controller.borderRadius.value.verticalBottom
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.borderRadius.value.verticalBottom =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.borderRadius.value);
                    },
                  ),
                ),
              ],
            ),
          ],
        ],
      );
    });
  }
}

class BorderRadiusToolController extends GetxController {
  Rx<BorderRadiusModel> borderRadius = BorderRadiusModel(
    type: BorderRadiusType.all,
  ).obs;
  BorderRadiusToolController(this.borderRadius);
}
