import 'package:a_shop/common/widgets/phones_heading.dart';
import 'package:flutter/material.dart';

import '../../features/shop/controllers/vertical_container.dart';
import '../../utilis/constants/colors.dart';
import '../../utilis/constants/image_strings.dart';
import '../../utilis/constants/size.dart';
import '../../utilis/helpers/helper_functions.dart';

class Phones extends StatelessWidget {
  const Phones({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: dark?AColors.white:Colors.red.shade50),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(ASizes.md),
                  margin: EdgeInsets.all(ASizes.sm),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey
                  ),
                  child: Column(
                    children: [
                      Text('Samsung', style: Theme.of(context).textTheme.headlineLarge!.apply(color: AColors.primary)),
                      SizedBox(height: ASizes.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(image: AssetImage(AImages.popularImage1),
                                width: 100,
                                fit: BoxFit.cover),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(image: AssetImage(AImages.popularImage1),
                                width: 100,
                                fit: BoxFit.cover),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(image: AssetImage(AImages.popularImage1),
                                width: 100,
                                fit: BoxFit.cover),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: ASizes.md),
              PhonesHeading(),
              SizedBox(height: ASizes.md),
              VerticalContainer(),
            ],
          )
        ),
      ),
    );
  }
}
