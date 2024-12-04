import 'package:buildify/app/commons/ui/inputs/alignment_selector.widget.dart';
import 'package:buildify/app/commons/ui/inputs/custom_switch.dart';
import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/builder_models/decoration_image.model.dart';
import 'package:buildify/app/models/image_provider_model/image_provider.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageDecorationController extends GetxController {
  Rx<DecorationImageModel> decorationImage = DecorationImageModel(
    image: ImageProviderModel(
      type: ImageProviderType.network,
    ),
    fit: BoxFit.cover,
    alignmentType: AlignmentType.center,
    repeat: ImageRepeat.noRepeat,
    opacity: 1.0,
    scale: 1.0,
    isAntiAlias: false,
    invertColors: false,
  ).obs;

  void setDecorationImage(DecorationImageModel initialValue) {
    decorationImage.value = initialValue;
  }

  void toggleAntiAlias(
      bool isAntiAlias, Function(DecorationImageModel) onChange) {
    decorationImage.update((val) {
      val?.isAntiAlias = isAntiAlias;
    });
    onChange(decorationImage.value);
  }

  void toggleInvertColors(
      bool invertColors, Function(DecorationImageModel) onChange) {
    decorationImage.update((val) {
      val?.invertColors = invertColors;
    });
    onChange(decorationImage.value);
  }

  void updateAlignment(
      AlignmentType alignmentType, Function(DecorationImageModel) onChange) {
    decorationImage.update((val) {
      val?.alignmentType = alignmentType;
    });
    onChange(decorationImage.value);
  }

  void updateFit(BoxFit fit, Function(DecorationImageModel) onChange) {
    decorationImage.update((val) {
      val?.fit = fit;
    });
    onChange(decorationImage.value);
  }

  void updateOpacity(double opacity, Function(DecorationImageModel) onChange) {
    decorationImage.update((val) {
      val?.opacity = opacity;
    });
    onChange(decorationImage.value);
  }

  void updateRepeat(
      ImageRepeat repeat, Function(DecorationImageModel) onChange) {
    decorationImage.update((val) {
      val?.repeat = repeat;
    });
    onChange(decorationImage.value);
  }
}

class ImageDecorationTool extends GetView<ImageDecorationController> {
  final DecorationImageModel? initialValue;
  final Function(DecorationImageModel) onChange;

  const ImageDecorationTool(
      {super.key, required this.onChange, this.initialValue});

  @override
  ImageDecorationController get controller {
    final ctrl = Get.put(ImageDecorationController(), tag: key.toString());
    if (initialValue != null) {
      ctrl.setDecorationImage(initialValue!);
    }
    return ctrl;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          buildHeader(context),
          const SizedBox(height: 10),
          if (controller.decorationImage.value.image?.type ==
              ImageProviderType.network) ...[
            TextFormField(
              initialValue: controller.decorationImage.value.image?.pathImage,
              decoration: const InputDecoration(label: Text('URL')),
              keyboardType: TextInputType.url,
              inputFormatters: const [],
              validator: (value) {
                if (value == null || value.isEmpty || !GetUtils.isURL(value)) {
                  return 'Please enter a valid URL';
                }
                return null;
              },
              onChanged: (value) {
                controller.decorationImage.update((val) {
                  val?.image?.pathImage = value;
                });
                onChange(controller.decorationImage.value);
              },
            ),
          ],
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    buildDropdown<BoxFit>(
                      label: "Fit",
                      values: BoxFit.values,
                      currentValue: controller.decorationImage.value.fit,
                      onChanged: (value) {
                        controller.updateFit(value, onChange);
                      },
                    ),
                    const SizedBox(height: 10),
                    buildDropdown<ImageRepeat>(
                      label: "Repeat",
                      values: ImageRepeat.values,
                      currentValue: controller.decorationImage.value.repeat,
                      onChanged: (value) {
                        controller.updateRepeat(value, onChange);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Tooltip(
                message: "Alignment",
                child: AlignmentSelector(
                    initialAlignment:
                        controller.decorationImage.value.alignmentType,
                    onChange: (value) {
                      controller.updateAlignment(value, onChange);
                      onChange(controller.decorationImage.value);
                    }),
              )
            ],
          ),
          const SizedBox(height: 10),
          buildSlider(
            label: "Opacity",
            min: 0.0,
            max: 1.0,
            value: controller.decorationImage.value.opacity,
            onChanged: (value) {
              controller.updateOpacity(value, onChange);
            },
          ),
          const SizedBox(height: 10),
          buildSwitch(
            label: "AntiAlias",
            value: controller.decorationImage.value.isAntiAlias,
            onChanged: (value) {
              controller.toggleAntiAlias(value, onChange);
            },
          ),
          const SizedBox(height: 10),
          buildSwitch(
            label: "Invert Colors",
            value: controller.decorationImage.value.invertColors,
            onChanged: (value) {
              controller.toggleInvertColors(value, onChange);
            },
          ),
        ],
      );
    });
  }

  Widget buildDropdown<T>({
    required String label,
    required List<T> values,
    required T? currentValue,
    required ValueChanged<T> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(label: Text(label)),
      value: currentValue,
      items: values
          .map((value) => DropdownMenuItem<T>(
                value: value,
                child: Text(value.toString().split('.').last),
              ))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Image',
          style: Get.textTheme.bodyMedium,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: ImageProviderType.values.map((type) {
            return Tooltip(
              message: type.name,
              child: InkWell(
                onTap: () {
                  controller.decorationImage.update((val) {
                    val?.image = ImageProviderModel(type: type);
                  });
                  onChange(controller.decorationImage.value);
                },
                child: Icon(
                  type.icon,
                  color: controller.decorationImage.value.image?.type == type
                      ? Get.theme.primaryColor
                      : Colors.grey,
                  size: 16,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildSlider({
    required String label,
    required double min,
    required double max,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Get.textTheme.bodyMedium),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: 10,
          label: value.toStringAsFixed(1),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget buildSwitch({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Get.textTheme.bodyMedium),
        CustomSwitch(
          height: 20,
          width: 40,
          toggleSize: 15,
          value: value,
          toggleColor: Get.theme.primaryColor,
          activeColor: Get.theme.primaryColor,
          activeToggleColor: Colors.white,
          inactiveColor: Get.theme.disabledColor,
          onToggle: onChanged,
          switchBorder: Border.all(color: Colors.grey.shade300, width: 2),
        ),
      ],
    );
  }
}
