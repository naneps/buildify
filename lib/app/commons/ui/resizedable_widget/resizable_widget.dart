import 'package:flutter/material.dart';

import 'resizable_widget_args_info.dart';
import 'resizable_widget_child_data.dart';
import 'resizable_widget_controller.dart';
import 'separator.dart';
import 'widget_size_info.dart';

/// The callback argument type of [ResizableWidget.onResized].
typedef OnResizedFunc = void Function(List<WidgetSizeInfo> infoList);

/// Holds resizable widgets as children.
/// Users can resize the internal widgets by dragging.
class ResizableWidget extends StatefulWidget {
  /// Resizable widget list.
  final List<Widget> children;

  /// Sets the default [children] width or height as percentages.
  ///
  /// If you set this value,
  /// the length of [percentages] must match the one of [children],
  /// and the sum of [percentages] must be equal to 1.
  ///
  /// If this value is [null], [children] will be split into the same size.
  final List<double>? percentages;

  /// Maximum sizes for each child widget.
  ///
  /// If set, the length must match the number of [children].
  final List<double>? maxSizes;

  /// When set to true, creates horizontal separators.
  @Deprecated('Use [isHorizontalSeparator] instead')
  final bool isColumnChildren;

  /// When set to true, creates horizontal separators.
  final bool isHorizontalSeparator;

  /// When set to true, Smart-Hide-Function is disabled.
  ///
  /// Smart-Hide-Function is that users can hide / show the both ends widgets
  /// by double-clicking the separators.
  final bool isDisabledSmartHide;

  /// Separator size.
  final double separatorSize;

  /// Separator color.
  final Color separatorColor;

  /// Callback of the resizing event.
  /// You can get the size and percentage of the internal widgets.
  ///
  /// Note that [onResized] is called every frame when resizing [children].
  final OnResizedFunc? onResized;

  /// Creates [ResizableWidget].
  ResizableWidget({
    super.key,
    required this.children,
    this.percentages,
    this.maxSizes,
    @Deprecated('Use [isHorizontalSeparator] instead')
    this.isColumnChildren = false,
    this.isHorizontalSeparator = false,
    this.isDisabledSmartHide = false,
    this.separatorSize = 4,
    this.separatorColor = Colors.white12,
    this.onResized,
  }) {
    assert(children.isNotEmpty);
    assert(percentages == null || percentages!.length == children.length);
    assert(maxSizes == null || maxSizes!.length == children.length);
    assert(percentages == null ||
        percentages!.reduce((value, element) => value + element) == 1);
  }

  @override
  _ResizableWidgetState createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {
  late ResizableWidgetArgsInfo _info;
  late ResizableWidgetController _controller;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          _controller.setSizeIfNeeded(constraints);
          return StreamBuilder(
            stream: _controller.eventStream.stream,
            builder: (context, snapshot) {
              // Apply max size constraints
              _applyMaxSizes(constraints);

              return _info.isHorizontalSeparator
                  ? Column(
                      children: _controller.children.map(_buildChild).toList())
                  : Row(
                      children: _controller.children.map(_buildChild).toList());
            },
          );
        },
      );

  @override
  void initState() {
    super.initState();

    _info = ResizableWidgetArgsInfo(widget);
    _controller = ResizableWidgetController(_info);
  }

  void _applyMaxSizes(BoxConstraints constraints) {
    if (widget.maxSizes != null) {
      int resizableIndex = 0; // Track index for maxSizes
      for (int i = 0; i < _controller.children.length; i++) {
        final child = _controller.children[i];

        // Skip separators
        if (child.widget is Separator) continue;

        if (resizableIndex < widget.maxSizes!.length) {
          final maxSize = widget.maxSizes![resizableIndex];
          final currentSize = _info.isHorizontalSeparator
              ? constraints.maxHeight
              : constraints.maxWidth;

          // Enforce the max size constraint
          child.size =
              child.size?.clamp(0, maxSize) ?? currentSize.clamp(0, maxSize);
          resizableIndex++;
        } else {
          // Log a warning if maxSizes and children are mismatched
          print("Warning: Mismatch between maxSizes and resizable children.");
        }
      }
    }
  }

  Widget _buildChild(ResizableWidgetChildData child) {
    if (child.widget is Separator) {
      return child.widget;
    }

    return SizedBox(
      width: _info.isHorizontalSeparator ? double.infinity : child.size,
      height: _info.isHorizontalSeparator ? child.size : double.infinity,
      child: child.widget,
    );
  }
}
