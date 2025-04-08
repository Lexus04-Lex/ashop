import 'package:a_shop/utilis/constants/size.dart';
import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/image_strings.dart';

class PopularCategoriesData extends StatelessWidget {
  const PopularCategoriesData({super.key, required this.image, required this.title,this.textColor=AColors.white, this.backgroundColor, this.onTap});
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 90,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder:(_, index){
            return Column(
              children: [
                Container(
                  width:60,
                  height: 60,
                  padding: EdgeInsets.all(ASizes.lg),
                  decoration: BoxDecoration(
                    color: AColors.white,
                    borderRadius: BorderRadius.circular(100)
                  ),
                    child: Image.asset(image, fit: BoxFit.fitHeight,)
            ),
              SizedBox(height: 10),
              Container(
                  margin: EdgeInsets.only(left: ASizes.defaultSpace),
                  child: Text(title, style: Theme.of(context).textTheme.bodySmall,))
              ],
            );
          } ,
          itemCount: 10,

        ),
      ),
    );
  }
}
