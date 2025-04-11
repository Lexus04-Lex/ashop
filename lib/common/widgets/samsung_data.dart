import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/size.dart';
import '../../utilis/helpers/helper_functions.dart';


class SamsungData extends StatelessWidget {
  const SamsungData({
    super.key, this.crossAxisCount, this.mainAxisExtent = 70, this.childAspectRatio = 0.8, this.crossAxisSpacing= 10, this.mainAxisSpacing = 10, this.shrinkWrap = true, required this.url, required this.itemCount, required this.name, this.price,
  });
  final int? crossAxisCount;
  final double? mainAxisExtent;
  final double? childAspectRatio;
  final int? crossAxisSpacing;
  final int? mainAxisSpacing;
  final bool? shrinkWrap;
  final String url;
  final int itemCount;
  final String name;
  final double? price;
  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: mainAxisExtent,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, index){
          return Container(
            padding: EdgeInsets.all(ASizes.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ASizes.md),
              color: dark? AColors.white:AColors.grey,),
            child: GestureDetector(
              onTap: (){},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage(url),
                            width: 100,
                            fit: BoxFit.cover),
                        Container(
                          decoration: BoxDecoration(
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(name),
                                      Icon(Icons.verified)
                                    ],
                                  ),
                                   Container(
                                     margin: EdgeInsets.only(left: ASizes.sm),
                                     child:
                                         Text('Price:240000/=',
                                          style: Theme.of(context).textTheme.bodySmall!.apply(color: dark?AColors.white:AColors.black),

                                      ),
                                   ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),

              ),
            ),
          );
        }
    );
  }
}