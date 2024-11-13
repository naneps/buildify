import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/models/user_gradient.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GradientPreviewView extends StatelessWidget {
  final UserGradientModel? userGradient;

  const GradientPreviewView({super.key, this.userGradient});

  @override
  Widget build(BuildContext context) {
    final gradient = userGradient?.gradient;
    final colors = gradient?.colors ?? [];

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            userGradient?.name ?? "Untitled",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              children: [
                Text("Colors (${colors.length})"),
                const SizedBox(width: 10),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(width: 5),
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.grey.shade500,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: colors[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          StaggeredGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              for (final tile in _buildGradientTiles())
                StaggeredGridTile.count(
                  crossAxisCellCount: tile.crossAxisCellCount,
                  mainAxisCellCount: tile.mainAxisCellCount,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                      gradient: gradient?.toGradient().value,
                      shape: tile.shape,
                      border: ThemeManager().defaultBorder(),
                      borderRadius: tile.shape == BoxShape.circle
                          ? null
                          : tile.borderRadius ?? BorderRadius.circular(10),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  List<_GradientTile> _buildGradientTiles() {
    return [
      _GradientTile(2, 2, BoxShape.rectangle),
      _GradientTile(2, 3, BoxShape.rectangle),
      _GradientTile(1, 1, BoxShape.rectangle),
      _GradientTile(1, 1, BoxShape.circle),
      _GradientTile(
        2,
        3,
        BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      _GradientTile(
        2,
        1,
        BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      _GradientTile(
        2,
        1,
        BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(35)),
      ),
      _GradientTile(
        2,
        1,
        BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      _GradientTile(2, 2, BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30)),
      _GradientTile(2, 2, BoxShape.circle),
      _GradientTile(4, 2, BoxShape.rectangle),
      _GradientTile(4, 3, BoxShape.rectangle),
      _GradientTile(4, 4, BoxShape.circle),
    ];
  }
}

class _GradientTile {
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final BoxShape shape;
  final BorderRadius? borderRadius;

  _GradientTile(this.crossAxisCellCount, this.mainAxisCellCount, this.shape,
      {this.borderRadius});
}
