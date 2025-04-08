import 'package:a_shop/common/widgets/wishlistpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/widgets/mainpag.dart';
import 'common/widgets/profilepage.dart';
import 'common/widgets/storepage.dart';

class NavigationMenuPage extends StatefulWidget {
  const NavigationMenuPage({super.key});

  @override
  State<NavigationMenuPage> createState() => _NavigationMenuPageState();
}

class _NavigationMenuPageState extends State<NavigationMenuPage> {
  final controller = Get.put(NavigationController());

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MainPage(),
      StorePage(),
      WishlistPage(),
      AccountPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: Obx(() => NavigationBar(
        height: 80,
        elevation: 0,
        animationDuration: const Duration(microseconds: 800),
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) =>
        controller.selectedIndex.value = index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.store), label: 'Store'),
          NavigationDestination(icon: Icon(Icons.widgets_sharp), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Icons.account_circle_sharp), label: 'Account'),
        ],
      )),
      body: Obx(() => _pages[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
}
