import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/shop/controllers/home_controller.dart';
import '../../utilis/constants/colors.dart';
import '../../utilis/constants/size.dart';
import 'acircular.dart';
import 'carousel_content.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.controller, required this.popular,
  });
  
  final List<String> popular;

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ASizes.defaultSpace),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                autoPlayCurve: Curves.decelerate,
                autoPlayInterval: Duration(seconds: 8),
                viewportFraction: 0.8,
                onPageChanged: (index,_) =>controller.updatePageIndicator(index)
            ),
            items:popular.map((url)=>CarouselContent(imageUrl: url)).toList()
          ),
          SizedBox(height: ASizes.spaceBtwItems),
          Obx(
                ()=> Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i <popular.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ACircularContainer(
                      width: 20,
                      height: 4,
                      backGroundColor: controller.carouselCurrentIndex.value==i
                          ? Colors.green
                          : AColors.primary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}