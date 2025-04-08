import 'package:a_shop/utilis/constants/size.dart';
import 'package:a_shop/utilis/devices/device_utility.dart';
import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:a_shop/utilis/constants/image_strings.dart';
import 'package:a_shop/utilis/constants/text_Strings.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utilis/constants/colors.dart';
import 'controllers_onboarding.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.UpdatePageIndicator,
            //Horizontal scrollable pages
            children: [
                OnBoardingPage(image: AImages.onboardingImage1,
                  title: ATexts.onBoardingTitle1,
                  subtitle: ATexts.onBoardingSubTitle1,
                ),
              OnBoardingPage(image: AImages.onboardingImage2,
                title: ATexts.onBoardingTitle2,
                subtitle: ATexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(image: AImages.onboardingImage3,
                title: ATexts.onBoardingTitle3,
                subtitle: ATexts.onBoardingSubTitle3,
              ),
            ],
          ),
            //Skip button
          onboardingskip(),

            //Next page button
          onboardingnext(),
            //Dot navigation smooth page indicator
          onboardingindicator()
        ],
      ),
    );
  }
}

class onboardingindicator extends StatelessWidget {
  const onboardingindicator({super.key,});

  @override
  Widget build(BuildContext context) {

    final controller = OnboardingController.instance;
    final dark = AHelperFunctions.isDarkMode(context);

    return Positioned(
      left: ASizes.defaultSpace,
      bottom: ADeviceUtils.getBottomNavigationBarHeight()*0.5,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(activeDotColor: dark ? AColors.light : AColors.dark, dotHeight: 6),
          controller: controller.pageController,
          onDotClicked: controller.DotNavigationClick,
          count: 3),
    );
  }
}

class onboardingnext extends StatelessWidget {
  const onboardingnext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Positioned(
      right: ASizes.defaultSpace,
      bottom: ADeviceUtils.getBottomNavigationBarHeight()*0.3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: CircleBorder(),
          backgroundColor: dark ? AColors.primary : AColors.black
        ),
        onPressed: (){
          OnboardingController.instance.NextPage();
        },
        child: Transform.rotate(angle: 3.14,
        child:Icon(Icons.arrow_back_ios_new,
        // color: dark ? AColors.light: AColors.dark,
        ),
        ),
      ),
    );
  }
}

class onboardingskip extends StatelessWidget {
  const onboardingskip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: ASizes.defaultSpace,
      top: ADeviceUtils.getStatusBarHeight(context),
        child: TextButton(onPressed: (){
          OnboardingController.instance.SkipPage();
        },
            child: Text('Skip',),
        ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final String image, title, subtitle;
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ASizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: AHelperFunctions.screenWidth(context)*0.8,
              height: AHelperFunctions.screenHeight(context)*0.6,
              image: AssetImage(image)),
          Text(title,
            style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,
          ),
          SizedBox(height: ASizes.spaceBtwItems,),
          Text(subtitle,
            style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}