import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/commons/ui/inputs/picker_color.widget.dart';
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
      BorderSideToolController(
        Rx(initValue ?? BorderModel.defaultBorder()),
      ),
      tag: key.toString());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final border = controller.border.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Toolbar for selecting BorderType
          _buildToolbar(context),
          const SizedBox(height: 10),
          if (border.type == BorderType.all) ...[
            _buildBorderInput(
              label: "All",
              borderSide: border.all,
              onWidthChanged: (value) {
                border.all?.width = double.parse(value);
                _updateBorder(border);
              },
              onColorChanged: (color) {
                border.all?.color = color;
                _updateBorder(border);
              },
            ),
          ] else if (border.type == BorderType.only) ...[
            ...["Left", "Top", "Right", "Bottom"].map((side) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: _buildBorderInput(
                  label: side,
                  borderSide: controller.getSide(side),
                  onWidthChanged: (value) {
                    controller.updateSideWidth(side, double.parse(value));
                    _updateBorder(border);
                  },
                  onColorChanged: (color) {
                    controller.updateSideColor(side, color);
                    _updateBorder(border);
                  },
                ),
              );
            }),
          ] else if (border.type == BorderType.symmetric) ...[
            Row(
              children: [
                Expanded(
                  child: _buildBorderInput(
                    label: "Horizontal",
                    borderSide: BorderSideModel(
                      width: border.left?.width,
                      color: border.left?.color,
                    ),
                    onWidthChanged: (value) {
                      final width = double.parse(value);
                      controller.updateSymmetricHorizontal(width);
                      _updateBorder(border);
                    },
                    onColorChanged: (color) {
                      controller.updateSymmetricHorizontalColor(color);
                      _updateBorder(border);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildBorderInput(
                    label: "Vertical",
                    borderSide: BorderSideModel(
                      width: border.top?.width,
                      color: border.top?.color,
                    ),
                    onWidthChanged: (value) {
                      final width = double.parse(value);
                      controller.updateSymmetricVertical(width);
                      _updateBorder(border);
                    },
                    onColorChanged: (color) {
                      controller.updateSymmetricVerticalColor(color);
                      _updateBorder(border);
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

  Widget _buildToolbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Border Side",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: BorderType.values.map((type) {
            return Tooltip(
              message: type.name,
              child: InkWell(
                onTap: () {
                  controller.updateType(type);
                  _updateBorder(controller.border.value);
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
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBorderInput({
    required String label,
    BorderSideModel? borderSide,
    required ValueChanged<String> onWidthChanged,
    required ValueChanged<Color> onColorChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: borderSide?.width?.toString() ?? "1.0",
            decoration: InputDecoration(label: Text(label)),
            onChanged: onWidthChanged,
          ),
        ),
        const SizedBox(width: 5),
        PickerColor(
          initialColor: borderSide?.color ?? Colors.black,
          onColorChanged: onColorChanged,
        ),
      ],
    );
  }

  void _updateBorder(BorderModel border) {
    controller.border.refresh();
    onChange?.call(border);
    print(border);
  }
}

class BorderSideToolController extends GetxController {
  Rx<BorderModel> border;

  BorderSideToolController(this.border);

  BorderSideModel? getSide(String side) {
    switch (side) {
      case "Left":
        return border.value.left;
      case "Top":
        return border.value.top;
      case "Right":
        return border.value.right;
      case "Bottom":
        return border.value.bottom;
      default:
        return null;
    }
  }

  void updateSideWidth(String side, double width) {
    final sideModel = getSide(side);
    if (sideModel != null) {
      sideModel.width = width;
    }
  }

  void updateSideColor(String side, Color color) {
    final sideModel = getSide(side);
    if (sideModel != null) {
      sideModel.color = color;
    }
  }

  void updateType(BorderType type) {
    border.value.type = type;
  }

  void updateSymmetricHorizontal(double width) {
    border.value.left?.width = width;
    border.value.right?.width = width;
  }

  void updateSymmetricVertical(double width) {
    border.value.top?.width = width;
    border.value.bottom?.width = width;
  }

  void updateSymmetricHorizontalColor(Color color) {
    border.value.left?.color = color;
    border.value.right?.color = color;
  }

  void updateSymmetricVerticalColor(Color color) {
    border.value.top?.color = color;
    border.value.bottom?.color = color;
  }
}
