import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/text_Strings.dart';

class FeaturedBrands extends StatelessWidget {
  const FeaturedBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(ATexts.popularBrands, style: Theme.of(context).textTheme.headlineLarge!.apply(color:dark? Colors.white: Colors.black),),
          TextButton(onPressed: (){}, child: Text(ATexts.viewAll, style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? Colors.white:AColors.primary),))
        ],
      ),
    );
  }
}
