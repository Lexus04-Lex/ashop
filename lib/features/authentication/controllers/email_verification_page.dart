import 'package:a_shop/features/authentication/controllers/email_verification_sucess.dart';
import 'package:a_shop/utilis/constants/text_Strings.dart';
import 'package:flutter/material.dart';
import 'package:a_shop/utilis/constants/image_strings.dart';
import 'package:get/get.dart';
import '../../../utilis/constants/size.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

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
            Text(ATexts.verifyEmail, style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height: ASizes.spaceBtwItems),
            Text(ATexts.welcomeMessage, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: ASizes.spaceBtwItems),
            //Continue button
            SizedBox(
              width: double.infinity,
              child: Container(
                child: ElevatedButton(onPressed: ()=>Get.to(()=>SuccessVerificationPage()),
                    child: Text(ATexts.buttonWithText)),
              ),
            ),
            SizedBox(height: ASizes.defaultSpace),
            Text(ATexts.resendEmail, style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
        ),
      ),
    );
  }
}
