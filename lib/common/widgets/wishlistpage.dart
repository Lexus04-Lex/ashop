import 'package:a_shop/common/widgets/phones_heading.dart';
import 'package:flutter/material.dart';

import '../../features/shop/controllers/vertical_container.dart';
class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: WishListHeading()),
    body:SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: 10),
          VerticalContainer(),
        ],
      ),
    ),
    );
  }
}
