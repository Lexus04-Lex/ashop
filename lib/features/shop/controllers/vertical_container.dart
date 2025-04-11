import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/vertical_container_widget.dart';

class VerticalContainer extends StatefulWidget {
  const VerticalContainer({super.key});

  @override
  State<VerticalContainer> createState() => _VerticalContainerState();
}

class _VerticalContainerState extends State<VerticalContainer> {

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return VerticalWidget(dark: dark);
  }
}

