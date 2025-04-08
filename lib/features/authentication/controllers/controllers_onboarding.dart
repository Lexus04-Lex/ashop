import 'package:a_shop/features/authentication/controllers/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void UpdatePageIndicator(int index) {
    currentPageIndex.value = index;
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
  }

  void SkipPage() {
    currentPageIndex.value = 2;
    if (pageController.hasClients) {
      pageController.jumpToPage(2);
    }
  }

  void NextPage() {
    if (currentPageIndex.value == 2) {
      // Navigate to login screen or next route
      Get.offAll(LoginScreen());
    } else {
      int nextPage = currentPageIndex.value + 1;
      if (pageController.hasClients) {
        pageController.jumpToPage(nextPage);
      }
    }
  }

  void DotNavigationClick(int index) {
    currentPageIndex.value = index;
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
  }
}
