import 'package:flutter/material.dart';

import '../../utilis/constants/colors.dart';
import '../../utilis/helpers/helper_functions.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AColors.darkerGrey),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: Colors.blue,
        indicatorPadding: EdgeInsets.zero,
        unselectedLabelColor: AColors.white,
        labelColor: AHelperFunctions.isDarkMode(context)
            ? AColors.white
            : Colors.blue,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}