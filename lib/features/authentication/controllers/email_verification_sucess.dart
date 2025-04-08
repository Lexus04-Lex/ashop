import 'package:a_shop/utilis/constants/text_Strings.dart';
import 'package:flutter/material.dart';
import 'package:a_shop/utilis/constants/image_strings.dart';
import '../../../utilis/constants/size.dart';

class SuccessVerificationPage extends StatelessWidget {
  const SuccessVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(padding: EdgeInsets.only(
            left: ASizes.defaultSpace,
            right: ASizes.defaultSpace,
            top: ASizes.appBarHeight,
            bottom: ASizes.defaultSpace
        ),
          child: Column(
            children: [
              Text(ATexts.afterVerification, style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: ASizes.spaceBtwItems),
              Text(ATexts.successMessage, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: ASizes.spaceBtwItems),
              //Continue button
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: ElevatedButton(onPressed: (){},
                      child: Text(ATexts.buttonWithText)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
