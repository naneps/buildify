import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PickerColor extends StatefulWidget {
  final Color? initialColor;
  final Function(Color) onColorChanged;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const PickerColor({
    super.key,
    this.initialColor,
    required this.onColorChanged,
    this.scaffoldKey,
  });

  @override
  State<PickerColor> createState() => _PickerColorState();
}

class _PickerColorState extends State<PickerColor> {
  Color _color = Colors.white;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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

  Padding buildPicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Pick a color',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Spacer(),
              InkWell(
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.error,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ColorPicker(
              pickerColor: _color,
              portraitOnly: true,
              pickerAreaHeightPercent: 0.7,
              onColorChanged: (color) {
                print(color);
                if (mounted) {
                  setState(() {
                    _color = color;
                    widget.onColorChanged(_color);
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant PickerColor oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.initialColor ?? Colors.white;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.scaffoldKey != null) scaffoldKey = widget.scaffoldKey!;
    _color = widget.initialColor ?? Colors.white;
  }

  void showBottomSheetPicker() {
    if (widget.scaffoldKey == null) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return buildPicker(context);
        },
      );
    }
    scaffoldKey.currentState!.showBottomSheet(
      (context) {
        return buildPicker(context);
      },
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
