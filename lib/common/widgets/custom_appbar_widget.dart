import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import 'appbar.dart';
import 'mainpag.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title, required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return AAppBar(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelLarge!.apply(color: AColors.grey),),
          Text(subTitle,style: Theme.of(context).textTheme.labelLarge!.apply(color: AColors.grey),),
        ],
      ),
      //Cart
      actions: [
        ACartCounterIcon()
      ],
    );
  }
}