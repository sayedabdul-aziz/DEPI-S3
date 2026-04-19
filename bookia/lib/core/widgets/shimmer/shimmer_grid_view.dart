import 'package:bookia/core/widgets/shimmer/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';

class ShimmerGridView extends StatelessWidget {
  const ShimmerGridView({
    super.key,
    required this.itemCount,
    this.itemHeight = 150,
    this.itemBuilder,
    required this.crossAxisCount,
    this.mainAxisSpacing = 10,
    this.crossAxisSpacing = 10,
    this.childAspectRatio = 1,
    this.mainAxisExtent,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = false,
    this.physics,
  });

  final int itemCount;
  final double itemHeight;
  final Widget Function(BuildContext, int)? itemBuilder;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double? mainAxisExtent;

  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
        mainAxisExtent: mainAxisExtent,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return itemBuilder?.call(context, index) ??
            CustomShimmerWidget(
              width: double.infinity,
              height: itemHeight,
              borderRadius: 10,
            );
      },
    );
  }
}
