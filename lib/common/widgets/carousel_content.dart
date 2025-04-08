import 'package:a_shop/utilis/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/image_strings.dart';

class CarouselContent extends StatelessWidget {
  final String imageUrl;
  final double? width, height;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsets? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  const CarouselContent({super.key, required this.imageUrl, this.width=200, this.applyImageRadius= false, this.border, this.fit, this.padding, required this.isNetworkImage, this.onPressed, this.height=200});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left:ASizes.defaultSpace,right: ASizes.defaultSpace),
        height: height,
        padding: padding,
        decoration: BoxDecoration(
        color: AColors.grey,
        borderRadius: BorderRadius.circular(ASizes.md)),
        width: size.width*0.85,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Column(
              children: [
                Image(image: isNetworkImage ? NetworkImage(imageUrl): AssetImage(imageUrl) as ImageProvider,fit: fit,),
              ],
            )),
      ),
    );
  }
}
