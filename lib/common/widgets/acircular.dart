import 'package:flutter/material.dart';
import 'package:a_shop/utilis/constants/colors.dart';
class ACircularContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? padding;
  final double? margin;
  final double? radius;
  final Widget? child;
  final Color? backGroundColor;

  const ACircularContainer({
    super.key,
    this.width, this.margin, this.backGroundColor, this.child, this.height,this.padding, this.radius
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(400)
      ),
    );
  }
}
