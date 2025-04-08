import 'package:a_shop/utilis/constants/size.dart';
import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../utilis/constants/colors.dart';
import '../../utilis/constants/text_Strings.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Padding(padding: EdgeInsets.only(left: ASizes.defaultSpace, right: ASizes.defaultSpace),
    child: Container(
      // color: dark? Colors.transparent:Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Container(
                // color: AColors.white,
            child: Text(ATexts.popularSearches,style: Theme.of(context).textTheme.headlineMedium!.apply(color:AColors.white), maxLines: 1, overflow: TextOverflow.ellipsis,),
          ),
              Container(
                child: TextButton(onPressed: (){}, child: Text(ATexts.viewAll, style: Theme.of(context).textTheme.headlineMedium!.apply(color: AColors.white),)),
              )
        ],
    ),
        ],
      ),
    ),
    );
  }
}
