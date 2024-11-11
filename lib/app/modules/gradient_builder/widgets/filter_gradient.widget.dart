import 'package:buildify/app/commons/theme_manager.dart';
import 'package:flutter/material.dart';

class FilterGradientWidget extends StatelessWidget {
  const FilterGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ThemeManager().scaffoldBackgroundColor,
        border: ThemeManager().defaultBorder(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            "FILTERS",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const Divider(),

          // Sort By Section
          Text("Sort By", style: Theme.of(context).textTheme.labelMedium),
          DropdownButton<String>(
            hint: const Text("Select Sort Option"),
            items: ["Name", "Color Count", "Direction"]
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
            onChanged: (value) {
              // Handle sort option selection here
            },
          ),
          const Divider(),

          // Gradient Type Section
          Text("Gradient Type", style: Theme.of(context).textTheme.labelMedium),
          DropdownButton<String>(
            hint: const Text("Select Gradient Type"),
            items: ["Linear", "Radial", "Sweep"]
                .map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    ))
                .toList(),
            onChanged: (value) {
              // Handle gradient type selection here
            },
          ),
          const Divider(),

          // Gradient Direction Section
          Text("Gradient Direction",
              style: Theme.of(context).textTheme.labelMedium),
          DropdownButton<String>(
            hint: const Text("Select Direction"),
            items: ["Top to Bottom", "Left to Right", "Diagonal"]
                .map((direction) => DropdownMenuItem(
                      value: direction,
                      child: Text(direction),
                    ))
                .toList(),
            onChanged: (value) {
              // Handle gradient direction selection here
            },
          ),
        ],
      ),
    );
  }
}
