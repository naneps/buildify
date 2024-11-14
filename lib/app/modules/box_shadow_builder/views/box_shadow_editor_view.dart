import 'package:buildify/app/commons/ui/inputs/colors_picker.widget.dart';
import 'package:buildify/app/models/builder_models/box_shadow.model.dart';
import 'package:buildify/app/modules/box_shadow_builder/controllers/box_shadow_editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BoxShadowEditorView extends GetView<BoxShadowEditorController> {
  final Function(BoxShadowModel)? onChange;
  const BoxShadowEditorView({super.key, this.onChange});

  @override
  BoxShadowEditorController get controller => Get.put(
        BoxShadowEditorController(),
        tag: "boxShadowEditorController${key.toString()}",
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(() {
          return ListView(
            children: [
              Text("Choose Your Shadow Color",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              ColorPickerWidget(
                initialColors: [controller.boxShadow.value.color],
                onColorsChanged: (value) {
                  controller.boxShadow.value.color = value.first;
                  controller.boxShadow.refresh();
                  onChange?.call(controller.boxShadow.value);
                },
                isMultiple: false,
                minColors: 1,
              ),
              const SizedBox(height: 15),
              _buildSlider(
                label: "Adjust Blur Radius",
                value: controller.boxShadow.value.blurRadius!,
                min: 0.0,
                max: 50.0,
                onChanged: (value) {
                  controller.boxShadow.value.blurRadius = value;
                  controller.boxShadow.refresh();
                  onChange?.call(controller.boxShadow.value);
                },
              ),
              const SizedBox(height: 15),
              _buildSlider(
                label: "Control Spread Radius",
                value: controller.boxShadow.value.spreadRadius!,
                min: -10.0,
                max: 20.0,
                onChanged: (value) {
                  controller.boxShadow.value.spreadRadius = value;
                  controller.boxShadow.refresh();
                  onChange?.call(controller.boxShadow.value);
                },
              ),
              const SizedBox(height: 15),
              Text("Offset Shadow Position",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: _buildSlider(
                      label: "Horizontal (X)",
                      value: controller.boxShadow.value.offset?.dx ?? 0.0,
                      min: -50.0,
                      max: 50.0,
                      onChanged: (value) {
                        controller.boxShadow.value.offset = Offset(
                          value,
                          controller.boxShadow.value.offset?.dy ?? 0.0,
                        );
                        controller.boxShadow.refresh();
                        onChange?.call(controller.boxShadow.value);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildSlider(
                      label: "Vertical (Y)",
                      value: controller.boxShadow.value.offset?.dy ?? 0.0,
                      min: -50.0,
                      max: 50.0,
                      onChanged: (value) {
                        controller.boxShadow.value.offset = Offset(
                          controller.boxShadow.value.offset?.dx ?? 0.0,
                          value,
                        );
                        controller.boxShadow.refresh();
                        onChange?.call(controller.boxShadow.value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text("Select Blur Style",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10.0,
                children: BlurStyle.values
                    .map((style) => ChoiceChip(
                          label: Text(style.name.capitalizeFirst ?? style.name),
                          selected:
                              controller.boxShadow.value.blurStyle == style,
                          onSelected: (value) {
                            if (value) {
                              controller.boxShadow.value.blurStyle = style;
                              controller.boxShadow.refresh();
                              onChange?.call(controller.boxShadow.value);
                            }
                          },
                        ))
                    .toList(),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Get.textTheme.titleMedium),
        const SizedBox(height: 5),
        SfSlider(
          value: value,
          min: min,
          max: max,
          enableTooltip: true,
          showLabels: true,
          labelFormatterCallback: (actualValue, formattedText) =>
              "${actualValue.toStringAsFixed(1)} px",
          onChanged: (value) {
            onChanged(value);
          },
        ),
      ],
    );
  }
}
