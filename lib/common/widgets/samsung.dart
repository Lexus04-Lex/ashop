import 'package:a_shop/common/widgets/samsung_data.dart';
import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/constants/image_strings.dart';
import '../../utilis/constants/size.dart';

class Samsung extends StatelessWidget {
  const Samsung({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
          padding: EdgeInsets.all(ASizes.md),
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Text('Phones', style: Theme.of(context).textTheme.headlineLarge!.apply(color: AColors.primary)),
                SizedBox(height: ASizes.md),
                SamsungData(url: AImages.popularImage7,itemCount: 10, name: 'SamSung s24',mainAxisExtent: 200)
                  ],
            ),
          ),
      ),
    );
  }
}
