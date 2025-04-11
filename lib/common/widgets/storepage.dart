import 'package:a_shop/common/widgets/mainpag.dart';
import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../utilis/constants/colors.dart';
import 'anestedscroll.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        // backgroundColor: Colors.red.shade50,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Store', style: Theme.of(context).textTheme.headlineLarge!.apply(color: dark? AColors.white:AColors.black)),
            actions:[
              ACartCounterIcon(),
            ]

        ),
        body: ANestedScroll(),
      ),
    );
  }}



