import 'package:a_shop/common/widgets/acircular.dart';
import 'package:a_shop/common/widgets/acurvededges.dart';
import 'package:a_shop/common/widgets/appbar.dart';
import 'package:a_shop/common/widgets/popular_categories_data.dart';
import 'package:a_shop/common/widgets/popular_categories_heading.dart';
import 'package:a_shop/common/widgets/searchbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/image_strings.dart';
import '../../utilis/constants/size.dart';
import '../../utilis/constants/text_Strings.dart';
import 'carousel_content.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentCarouselIndex = 0; // Track current carousel index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AHeaderContainer(
              child: Column(
                children: [
                  //App bar
                  CustomAppBar(),
                  //Search bar
                  SizedBox(height: ASizes.spaceBtwItems),
                  Searchbar(),
                  SizedBox(height: ASizes.spaceBtwItems),
                  PopularCategories(),
                  SizedBox(height: ASizes.spaceBtwItems),
                  PopularCategoriesData(title: 'Phones',image: AImages.popularImage1,onTap: (){},)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(ASizes.defaultSpace),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.decelerate,
                      autoPlayInterval: Duration(seconds: 8),
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentCarouselIndex = index;
                        });
                      },
                    ),
                    items: [
                      CarouselContent(imageUrl: AImages.popularImage4, isNetworkImage: false),
                      CarouselContent(imageUrl: AImages.popularImage1, isNetworkImage: false),
                      CarouselContent(imageUrl: AImages.popularImage6, isNetworkImage: false),
                    ],
                  ),
                  SizedBox(height: ASizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ACircularContainer(
                            width: 20,
                            height: 4,
                            backGroundColor: _currentCarouselIndex == i
                                ? Colors.green
                                : AColors.primary,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AAppBar(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ATexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelLarge!.apply(color: AColors.grey),),
          Text(ATexts.homeAppbarSubTitle,style: Theme.of(context).textTheme.labelLarge!.apply(color: AColors.grey),),
        ],
      ),
      //Cart
      actions: [
        ACartCounterIcon()
                    ],
                  );
  }
}

class ACartCounterIcon extends StatelessWidget {
  const ACartCounterIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
      ShoppingCart(),
      Positioned(
        right: 0,
        child: Container(
          height: 20,
            width: 20,
            decoration: BoxDecoration(color: AColors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100)
            ),
            child: Center(child:Text('2', style: TextStyle(color:AColors.white))),
        ),
      ),
                        ],
                      );
  }
}

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart), color: AColors.white,);
  }
}
class AHeaderContainer extends StatelessWidget {
  const AHeaderContainer({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ACurvedWidget(
      child: child,
    );
  }
}

class ACurvedWidget extends StatelessWidget {
  const ACurvedWidget({
    super.key, required this.child,
  });
final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ACurvedEdges(),
      child: Container(
        color: AColors.primary,
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                  top: -150,right: -150,
                  child: ACircularContainer(width: 400,height: 400,backGroundColor: AColors.darkerGrey.withAlpha(220))),
              Positioned(
                  top: 100,right: -300,
                  child: ACircularContainer(width: 400,height: 400,backGroundColor: AColors.darkerGrey.withAlpha(220))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

