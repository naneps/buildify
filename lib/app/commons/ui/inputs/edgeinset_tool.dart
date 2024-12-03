import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EdgeInsetTool extends GetView<EdgeInsetToolController> {
  final Function(EdgeInsetModel)? onChange;
  final String? label;
  final EdgeInsetModel initValue;
  const EdgeInsetTool({
    super.key,
    required this.onChange,
    required this.initValue,
    this.label,
  });

  @override
  get controller =>
      Get.put(EdgeInsetToolController(Rx(initValue)), tag: key.toString());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Toolbar for selecting EdgeInsetType
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label ?? "Edge Inset",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...EdgeInsetType.values.map((e) {
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
                          controller.edgeInset.value.type = e;
                          controller.edgeInset.refresh();
                          onChange!(controller.edgeInset.value);
                        },
                        child: Icon(
                          e.icon,
                          color: e == controller.edgeInset.value.type
                              ? MainColors.primaryColor
                              : Colors.grey,
                          size: 14,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (controller.edgeInset.value.type == EdgeInsetType.all) ...[
            SizedBox(
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("All"),
                ),
                initialValue:
                    controller.edgeInset.value.all?.toInt().toString(),
                onChanged: (value) {
                  controller.edgeInset.value.all = double.tryParse(value) ?? 0;
                  onChange!(controller.edgeInset.value);
                },
              ),
            )
          ] else if (controller.edgeInset.value.type == EdgeInsetType.only) ...[
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("L")),
                    initialValue:
                        controller.edgeInset.value.left?.toInt().toString(),
                    onChanged: (value) {
                      controller.edgeInset.value.left =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.edgeInset.value);
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("T"),
                    ),
                    initialValue:
                        controller.edgeInset.value.top?.toInt().toString(),
                    onChanged: (value) {
                      controller.edgeInset.value.top =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.edgeInset.value);
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
                      label: Text("R"),
                    ),
                    initialValue:
                        controller.edgeInset.value.right?.toInt().toString(),
                    onChanged: (value) {
                      controller.edgeInset.value.right =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.edgeInset.value);
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("B"),
                    ),
                    initialValue:
                        controller.edgeInset.value.bottom?.toInt().toString(),
                    onChanged: (value) {
                      controller.edgeInset.value.bottom =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.edgeInset.value);
                    },
                  ),
                ),
              ],
            ),
          ] else if (controller.edgeInset.value.type ==
              EdgeInsetType.symmetric) ...[
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Horizontal"),
                    ),
                    initialValue: controller.edgeInset.value.horizontal
                        ?.toInt()
                        .toString(),
                    onChanged: (value) {
                      controller.edgeInset.value.horizontal =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.edgeInset.value);
                    },
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Vertical"),
                    ),
                    initialValue:
                        controller.edgeInset.value.vertical?.toInt().toString(),
                    onChanged: (value) {
                      controller.edgeInset.value.vertical =
                          double.tryParse(value) ?? 0;
                      onChange!(controller.edgeInset.value);
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

class EdgeInsetToolController extends GetxController {
  Rx<EdgeInsetModel> edgeInset = EdgeInsetModel(
    type: EdgeInsetType.all,
    all: 0,
    left: 0,
    top: 0,
    right: 0,
    bottom: 0,
    horizontal: 0,
    vertical: 0,
  ).obs;
  EdgeInsetToolController(this.edgeInset);
}
