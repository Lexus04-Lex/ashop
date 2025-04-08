import 'package:a_shop/features/authentication/controllers/forgotpassword_succes.dart';
import 'package:a_shop/utilis/constants/text_Strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilis/constants/size.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(padding: EdgeInsets.only(
          top: ASizes.appBarHeight,
          bottom: ASizes.defaultSpace,
          left: ASizes.defaultSpace,
          right: ASizes.defaultSpace,
        ),
        child: Column(
          children: [
            Text(ATexts.forgotPasswordTitle,style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height: ASizes.spaceBtwItems),
            Text(ATexts.forgotPasswordBody),
            SizedBox(height: ASizes.spaceBtwItems),
            Form(child: TextFormField(
              decoration: InputDecoration(
                labelText: ATexts.enterEmail,
                prefixIcon: Icon(Icons.email_outlined),
              ),
            )),
            SizedBox(height: ASizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed:
                  ()=>Get.to(()=>ForgotPasswordSuccess()) ,child: Text(ATexts.sendVerificationEmail)),
            )
          ],
        ),
        ),
      ),
    );
  }
}
