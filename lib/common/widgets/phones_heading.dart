import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/size.dart';
import '../../utilis/constants/text_Strings.dart';
import '../../utilis/helpers/helper_functions.dart';
class PhonesHeading extends StatelessWidget {
  const PhonesHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ASizes.md),
      // margin: EdgeInsets.all(ASizes.sm),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          color: Colors.grey,),
        child: Expanded(child: Text(ATexts.createdForYou, style:
          Theme.of(context).textTheme.headlineMedium!.apply(color: dark?AColors.white:AColors.primary)
          ,)),
    );
  }
}

class WishListHeading extends StatelessWidget {
  const WishListHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ASizes.md),
      // margin: EdgeInsets.all(ASizes.sm),
      decoration: BoxDecoration(),
      child: Expanded(child: Text('WishList', style:
      Theme.of(context).textTheme.headlineMedium!.apply(color: dark?AColors.white:AColors.primary)
        ,)),
    );
  }
}