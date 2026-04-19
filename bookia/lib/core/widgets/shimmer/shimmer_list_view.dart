import 'package:bookia/core/widgets/shimmer/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({
    super.key,
    required this.itemCount,
    this.itemHeight = 100,
    this.itemBuilder,
    this.separatorHeight = 10,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = false,
    this.physics,
  });

  final int itemCount;
  final double itemHeight;
  final Widget Function(BuildContext, int)? itemBuilder;
  final double separatorHeight;
  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: itemCount,
      separatorBuilder: (context, index) => SizedBox(height: separatorHeight),
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
