import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/typewriter_markdown.dart';
import 'package:buildify/app/commons/ui/inputs/neo_dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PreviewCodeWidget extends StatefulWidget {
  final String codeFlutter;
  final String codeCss;
  const PreviewCodeWidget({
    super.key,
    required this.codeFlutter,
    required this.codeCss,
  });

  @override
  _PreviewCodeWidgetState createState() => _PreviewCodeWidgetState();
}

class _PreviewCodeWidgetState extends State<PreviewCodeWidget> {
  String _selectedCodeType = 'Flutter'; // Default to Flutter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      height: Get.height,
      decoration: BoxDecoration(
        color: ThemeManager().scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: ThemeManager().defaultBorder(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Preview Code",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Spacer(),
              InkWell(
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.error,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          NeoDropdown<String>(
            hint: const Text("Choose your code type to preview"),
            value: _selectedCodeType,
            items: ['Flutter', 'CSS']
                .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCodeType = value!;
              });
            },
          ),
          Expanded(
            child: getSelectedCode().isNotEmpty
                ? TypewriterMarkdown(getSelectedCode())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.codeTags, size: 40),
                      const SizedBox(height: 10),
                      const Text(
                          "No code available for display. Select a type to begin."),
                    ],
                  ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  String getSelectedCode() {
    switch (_selectedCodeType) {
      case 'Flutter':
        return widget.codeFlutter;
      case 'CSS':
        return widget.codeCss;
      default:
        return '';
    }
  }
}
