import 'dart:math';

import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/commons/ui/buttons/neo_button.dart';
import 'package:buildify/app/commons/ui/inputs/inc_dec_widget.dart';
import 'package:buildify/app/enums/comparation_operator.dart';
import 'package:buildify/app/models/filter/count_color.dart';
import 'package:buildify/app/models/filter/filter_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterGradientController extends GetxController {
  Rx<FilterGradientModel> filter = FilterGradientModel(
    colorCount: CountColor(count: null, operator: null),
    colors: [],
    type: 'all',
  ).obs;

  void resetFilter() {
    filter.update((val) {
      val?.colorCount = CountColor(count: 2, operator: null);
      val?.colors = [];
      val?.type = 'all';
    });
  }

  void setColorCount(int? count) {
    filter.update((val) {
      val?.colorCount!.count = count;
    });
  }

  void setColors(List<int>? colors) {
    filter.update((val) {
      val?.colors = colors;
    });
  }

  void setDirection(String? direction) {
    filter.update((val) {
      val?.direction = direction;
    });
  }

  void setSort(String? sort) {
    filter.update((val) {
      val?.sort = sort;
    });
  }

  void setType(String? type) {
    filter.update((val) {
      val?.type = type;
    });
  }

  // Tambahkan metode lain sesuai kebutuhan
}

class FilterGradientWidget extends GetView<FilterGradientController> {
  Function(FilterGradientModel) onFilterChange;
  FilterGradientWidget({super.key, required this.onFilterChange});
  @override
  get controller => Get.put(FilterGradientController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        border: ThemeManager().defaultBorder(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "FILTERS",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Spacer(),
                InkWell(
                  child: const Icon(Icons.close),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
            const Divider(),
            Text(
              "Type",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 5),
            Obx(
              () => Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (var type in ['All', 'Linear', 'Radial', 'Sweep'])
                    ChoiceChip(
                      label: Text(
                        type,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(),
                      ),
                      selected:
                          controller.filter.value.type == type.toLowerCase(),
                      padding: const EdgeInsets.all(5),
                      selectedColor: Get.theme.primaryColor,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onSelected: (value) {
                        controller.setType(type.toLowerCase());
                      },
                    )
                ],
              ),
            ),
            const Divider(),
            Row(
              children: [
                Text("Operators",
                    style: Theme.of(context).textTheme.labelMedium),
                const Spacer(),
                Text("Color Count",
                    style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            const SizedBox(height: 5),
            Obx(() {
              return Row(
                children: [
                  Row(
                    children: [
                      ...ComparisonOperator.values.map(
                        (operator) {
                          return InkWell(
                            onTap: () {
                              controller.filter.value.colorCount!.operator =
                                  operator;
                              controller.filter.refresh();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                operator.symbol,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: controller.filter.value.colorCount!
                                                  .operator ==
                                              operator
                                          ? Get.theme.primaryColor
                                          : null,
                                    ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  const Spacer(),
                  IncDecWidget(
                    min: 2,
                    max: 10,
                    value: controller.filter.value.colorCount!.count ?? 2,
                    step: 1,
                    onValueChanged: (value) {
                      controller.setColorCount(value);
                    },
                  )
                ],
              );
            }),
            const Divider(),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: NeoButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.scaffoldBackgroundColor,
                      ),
                      onPressed: () {
                        controller.filter.value = FilterGradientModel(
                          colorCount: CountColor(
                              count: 2, operator: ComparisonOperator.equals),
                          colors: [],
                          type: 'all',
                        );
                        controller.resetFilter();
                        onFilterChange(controller.filter.value);
                        Get.back();
                      },
                      child: const Text("Reset"),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: NeoButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.successColor,
                      ),
                      onPressed: () {
                        onFilterChange(controller.filter.value);
                        Get.back();
                      },
                      child: const Text("Apply"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menentukan warna teks berdasarkan warna chip
  bool useWhiteForeground(Color backgroundColor, {double bias = 0.0}) {
    int v = sqrt(pow(backgroundColor.red, 2) * 0.299 +
            pow(backgroundColor.green, 2) * 0.587 +
            pow(backgroundColor.blue, 2) * 0.114)
        .round();
    return v < 130 + bias;
  }
}
