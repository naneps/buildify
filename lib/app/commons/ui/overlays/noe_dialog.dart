import 'dart:ui';

import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/commons/ui/buttons/neo_button.dart';
import 'package:buildify/app/commons/ui/overlays/scale_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NeoDialog {
  // Build the dialog widget
  static Widget build(
    BuildContext context, {
    required NeoDialogType type,
    String title = "Dialog",
    String message = "This is a dialog",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    final Color primaryColor;
    switch (type) {
      case NeoDialogType.warning:
        primaryColor = MainColors.warningColor;
        break;
      case NeoDialogType.error:
        primaryColor = MainColors.dangerColor;
        break;
      case NeoDialogType.success:
        primaryColor = MainColors.successColor;
        break;
      case NeoDialogType.info:
      default:
        primaryColor = MainColors.infoColor;
        break;
    }

    return Container(
      constraints:
          BoxConstraints(minWidth: Get.width * 0.2, maxWidth: Get.width * 0.5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MainColors.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: ThemeManager().defaultBorder(),
        boxShadow: [
          ThemeManager().defaultShadow(
            color: primaryColor,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MainColors.darkColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MainColors.darkColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(),
          SizedBox(
            height: 35,
            child: Row(
              children: [
                Expanded(
                  child: NeoButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.dangerColor),
                    onPressed: onCancel ?? () => Navigator.of(context).pop(),
                    child: const Text("Close"),
                  ),
                ),
                if (onConfirm != null) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: NeoButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColors.successColor,
                        foregroundColor: MainColors.darkColor,
                      ),
                      onPressed: onConfirm,
                      child: const Text("Confirm"),
                    ),
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }

  // Show dialog with specified type
  static void show(
    BuildContext context, {
    required NeoDialogType type,
    String title = "Dialog",
    String message = "This is a dialog",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    _showDialog(
      context,
      type: type,
      title: title,
      message: message,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  static void showDialogByKey(
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
    NeoDialogType type, {
    String title = "Dialog",
    String message = "This is a dialog",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    if (scaffoldKey.currentState != null) {
      show(
        scaffoldKey.currentContext!,
        type: type,
        title: title,
        message: message,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    }
  }

  // Helper method to show the dialog
  static _showDialog(
    BuildContext context, {
    required NeoDialogType type,
    String title = "Dialog",
    String message = "This is a dialog",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    showDialog(
      barrierColor: MainColors.darkColor.withOpacity(0.5),
      useSafeArea: true,
      context: context,
      builder: (_) => ScaleDialog(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            content: build(
              context,
              type: type,
              title: title,
              message: message,
              onConfirm: onConfirm,
              onCancel: onCancel,
            ),
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

// Enum to handle different dialog types
enum NeoDialogType { info, warning, error, success }
