import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  CommonShimmerWidget(
      {Key? key, required this.height, required this.width, required this.borderRadius, required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).splashColor,
      highlightColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: Colors.white,
        ),
        height: height,
        width: width,
        margin: margin,
      ),
    );
  }
}
