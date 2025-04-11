import 'package:a_shop/common/widgets/acircular.dart';
import 'package:a_shop/common/widgets/acurvededges.dart';
import 'package:a_shop/common/widgets/popular_categories_data.dart';
import 'package:a_shop/common/widgets/popular_categories_heading.dart';
import 'package:a_shop/common/widgets/promo_slider_widget.dart';
import 'package:a_shop/common/widgets/searchbar.dart';
import 'package:a_shop/features/shop/controllers/home_controller.dart';
import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/shop/controllers/vertical_container.dart';
import '../../utilis/constants/colors.dart';
import '../../utilis/constants/image_strings.dart';
import '../../utilis/constants/size.dart';
import '../../utilis/constants/text_Strings.dart';
import 'custom_appbar_widget.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Track current carousel index

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      // backgroundColor: Colors.red.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AHeaderContainer(
              child: Column(
                children: [
                  //App bar
                  CustomAppBar(title: ATexts.homeAppbarTitle,subTitle: ATexts.homeAppbarSubTitle,),
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

            //Carousel slider
            PromoSlider(controller: controller, popular: [AImages.popularImage1,AImages.popularImage2, AImages.popularImage3, AImages.popularImage4,AImages.popularImage9, AImages.popularImage6],),
            PopularCategories(),
            VerticalContainer(),
          ],
        ),
      ),
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
      ShoppingCart(color: AColors.darkerGrey,),
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
    super.key,this.color,
  });
 final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart));
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

