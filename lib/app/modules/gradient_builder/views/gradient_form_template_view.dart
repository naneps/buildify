import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/commons/ui/buttons/neo_button.dart';
import 'package:buildify/app/commons/ui/scroll_to_hide.widget.dart';
import 'package:buildify/app/models/user_gradient.model.dart';
import 'package:flutter/material.dart';

class FormTemplateView extends StatelessWidget {
  final UserGradientModel gradient;
  Function(UserGradientModel)? onSave;
  final ScrollController scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();
  FormTemplateView({
    super.key,
    required this.gradient,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: ThemeManager().defaultBorder(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                controller: scrollController,
                children: [
                  Text(
                    "Make your gradient",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        "Gradient Type",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        gradient.gradient!.type.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Gradient Name",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                      hintText: "Enter gradient name",
                    ),
                    maxLength: 30,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      if (value.length >= 30) {
                        return 'Name must be less than 30 characters';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      formKey.currentState!.validate();
                      gradient.name = value;
                    },
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Preview',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      border: ThemeManager().defaultBorder(),
                      borderRadius: BorderRadius.circular(10),
                      gradient: gradient.gradient!.toGradient().value,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text("Colors Scheme",
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: gradient.gradient!.colors.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        backgroundColor: gradient.gradient!.colors[index],
                        child: Container(
                            decoration: BoxDecoration(
                          color: gradient.gradient!.colors[index],
                          shape: BoxShape.circle,
                          border: ThemeManager().defaultBorder(),
                        )),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            ScrollToHide(
              controller: scrollController,
              child: Row(
                children: [
                  Expanded(
                    child: NeoButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.successColor,
                        textStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          onSave?.call(gradient);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: NeoButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.dangerColor,
                        textStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
