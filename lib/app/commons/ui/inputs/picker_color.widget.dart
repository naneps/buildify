import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PickerColor extends StatefulWidget {
  final Color? initialColor;
  Function(Color) onColorChanged;
  PickerColor({
    super.key,
    this.initialColor,
    required this.onColorChanged,
  });

  @override
  State<PickerColor> createState() => _PickerColorState();
}

class _PickerColorState extends State<PickerColor> {
  Color _color = Colors.white;

  @override
  void didUpdateWidget(covariant PickerColor oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.initialColor ?? Colors.white;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _color = widget.initialColor ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheetPicker();
      },
      child: AnimatedContainer(
        height: 25,
        width: 25,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _color,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  void showBottomSheetPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pick a color',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Divider(),
              Expanded(
                child: ColorPicker(
                  pickerColor: _color,
                  portraitOnly: true,
                  pickerAreaHeightPercent: 0.7,
                  onColorChanged: (color) {
                    setState(() {
                      _color = color;
                    });
                    widget.onColorChanged(_color);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
