import 'package:buildify/app/commons/ui/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/widget_builder_controller.dart';

class WidgetBuilderView extends GetView<WidgetBuilderController> {
  const WidgetBuilderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WidgetBuilderView'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        mobile: const Center(
          child: Text("Mobile View \n Coming Soon"),
        ),
        tablet: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Obx(() {
                      return controller.widget.value.build();
                    }),
                    SizedBox(height: Get.height * 0.1),
                    ElevatedButton(
                      onPressed: () {
                        print('save');
                        controller.saveWidget();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: StreamBuilder(
                  stream: controller.streamWidgets(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print(snapshot);
                      return Center(child: Text('Errors: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No widgets found'));
                    } else {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onDoubleTap: () {
                                controller.repo
                                    .deleteItem(snapshot.data![index].id!);
                              },
                              child: snapshot.data![index].widget?.build());
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
