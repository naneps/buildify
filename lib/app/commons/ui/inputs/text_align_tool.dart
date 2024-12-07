import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextAlignTool extends StatelessWidget {
  final Rx<TextAlign> textAlign;
  Function(TextAlign value) onChange;
  TextAlignTool({super.key, required this.textAlign, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemCount: TextAlign.values.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final currentAlign = TextAlign.values[index];
        return Obx(() => Tooltip(
              message: currentAlign.name,
              child: InkWell(
                onTap: () {
                  textAlign.value = currentAlign;
                  textAlign.refresh();
                  onChange.call(currentAlign);
                },
                child: Icon(
                  currentAlign.icon,
                  color: currentAlign == textAlign.value
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  size: 20,
                ),
              ),
            ));
      },
    );
  }
}

class TextOverflowTool extends StatelessWidget {
  final Rx<TextOverflow> textOverflow;
  const TextOverflowTool({super.key, required this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 4,
      ),
      itemCount: TextOverflow.values.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final currentOverflow = TextOverflow.values[index];
        return Obx(() => Tooltip(
              message: currentOverflow.name,
              child: InkWell(
                onTap: () => textOverflow.value = currentOverflow,
                child: Icon(
                  currentOverflow.icon,
                  color: currentOverflow == textOverflow.value
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  size: 15,
                ),
              ),
            ));
      },
    );
  }
}

extension TextAlignExtension on TextAlign {
  IconData? get icon => {
        TextAlign.left: Icons.format_align_left,
        TextAlign.right: Icons.format_align_right,
        TextAlign.center: Icons.format_align_center,
        TextAlign.justify: Icons.format_align_justify,
        TextAlign.start: Icons.format_align_left,
        TextAlign.end: Icons.format_align_right,
      }[this];
}

extension TextOverflowExtension on TextOverflow {
  IconData? get icon => {
        TextOverflow.clip: Icons.cut,
        TextOverflow.fade: Icons.blur_on,
        TextOverflow.ellipsis: Icons.more_horiz,
        TextOverflow.visible: Icons.visibility,
      }[this];
}
