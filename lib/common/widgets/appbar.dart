import 'package:a_shop/utilis/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilis/constants/size.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AAppBar({super.key, this.title, this.showBackArrow=true, this.leadingIcon, this.actions, this.leadingOnPressed});
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: ASizes.defaultSpace),
    child: AppBar(
      automaticallyImplyLeading: false,
      // leading: showBackArrow ? IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_back_ios)):IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)),
      title: title,
      actions: actions,
    ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ADeviceUtils.appBarHeight);

}