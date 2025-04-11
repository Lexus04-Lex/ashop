import 'package:a_shop/utilis/constants/size.dart';
import 'package:a_shop/utilis/devices/device_utility.dart';
import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/text_Strings.dart';
class Searchbar extends StatelessWidget {
  const  Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
      //Custom search bar
      child: CustomSearchBar(),
    );
  }
}
//Custom search bar
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Container(
      height: 40,
      width: ADeviceUtils.getScreenWidth(context),
      padding: EdgeInsets.only(left:ASizes.defaultSpace),
      decoration: BoxDecoration(

        color: dark? Colors.transparent:Colors.transparent,
        borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AColors.grey)
      ),
      child: Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, color: dark? AColors.dark: AColors.dark,),
            SizedBox(width: ASizes.defaultSpace,),
            Text(ATexts.search, style: TextStyle(color: dark? AColors.dark:AColors.dark, ) ),
          ],
        ),
      ),
    );
  }
}
