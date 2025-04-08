import 'package:a_shop/features/authentication/controllers/login.dart';
import 'package:a_shop/utilis/constants/text_Strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilis/constants/size.dart';

class ForgotPasswordSuccess extends StatelessWidget {
  const ForgotPasswordSuccess({super.key});

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
              Text(ATexts.passwordReset, style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: ASizes.spaceBtwItems),
              Text(ATexts.forgotPasswordBody),
              SizedBox(height: ASizes.spaceBtwItems),
              Form(child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.token),
                  labelText: ATexts.passwordResetToken
                ),
              )),
              SizedBox(height: ASizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=>Get.to(()=>LoginScreen()), child: Text(ATexts.success)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
