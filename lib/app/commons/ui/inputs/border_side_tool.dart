import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorderSideTool extends GetView<BorderSideToolController> {
  final Function(BorderModel)? onChange;
  final BorderModel? initValue;
  const BorderSideTool({
    super.key,
    required this.onChange,
    this.initValue,
  });

  @override
  get controller => Get.put(
      BorderSideToolController(Rx(initValue ??
          BorderModel(
            type: BorderType.all,
            all: BorderSideModel(width: 1.0, style: BorderStyle.solid),
          ))),
      tag: key.toString());

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
                "Border Side",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...BorderType.values.map((type) {
                    return Tooltip(
                      message: type.name,
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
                          controller.border.value.type = type;
                          controller.border.refresh();
                          onChange!(controller.border.value);
                        },
                        child: Icon(
                          type.icon,
                          color: type == controller.border.value.type
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
          if (controller.border.value.type == BorderType.all) ...[
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("All"),
                      ),
                      onChanged: (value) {
                        onChange!(controller.border.value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  AnimatedContainer(
                    height: 25,
                    width: 25,
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: controller.border.value.all!.color,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                ],
              ),
            )
          ] else if (controller.border.value.type == BorderType.only) ...[
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("L")),
                    onChanged: (value) {
                      onChange!(controller.border.value);
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("T")),
                    onChanged: (value) {
                      onChange!(controller.border.value);
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
                    decoration: const InputDecoration(label: Text("R")),
                    onChanged: (value) {
                      onChange!(controller.border.value);
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("B")),
                    onChanged: (value) {
                      onChange!(controller.border.value);
                    },
                  ),
                ),
              ],
            ),
          ] else if (controller.border.value.type == BorderType.symmetric) ...[
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Horizontal"),
                    ),
                    onChanged: (value) {
                      onChange!(controller.border.value);
                    },
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Vertical"),
                    ),
                    onChanged: (value) {
                      onChange!(controller.border.value);
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

class BorderSideToolController extends GetxController {
  Rx<BorderModel> border = BorderModel(
    type: BorderType.all,
    all: BorderSideModel(
      color: Colors.black,
      width: 1.0,
      style: BorderStyle.solid,
    ),
  ).obs;
  BorderSideToolController(this.border);
}
