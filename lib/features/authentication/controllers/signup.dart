import 'package:a_shop/features/authentication/controllers/email_verification_page.dart';
import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:a_shop/utilis/constants/text_Strings.dart';
import 'package:get/get.dart';
import '../../../utilis/constants/colors.dart';
import '../../../utilis/constants/size.dart';
import 'package:a_shop/utilis/constants/image_strings.dart';
//Main Class to contain all Sign Up Content(classes)
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: ASizes.appBarHeight,
            bottom: ASizes.defaultSpace,
            left: ASizes.defaultSpace,
            right: ASizes.defaultSpace
          ),
          child: Column(
            children: [
              Center(child: Text(ATexts.signupTitle, style: Theme.of(context).textTheme.headlineLarge,)),
              SizedBox(height: ASizes.spaceBtwSections,),
              Form(child: Column(
                  children: [
                    Row(
                      children: [
                        //First name field
                        FirstName(),
                        SizedBox(width: ASizes.spaceBtwInputFields), // spacing between fields
                        //Last name field
                        LastName(),
                      ],
                    ),
                    SizedBox(height: ASizes.spaceBtwInputFields),
                    Username(),
                    SizedBox(height: ASizes.spaceBtwInputFields),

                    Email(),
                    SizedBox(height: ASizes.spaceBtwInputFields,),

                    Phone(),
                    SizedBox(height: ASizes.spaceBtwInputFields,),

                    Password(),
                    SizedBox(height: ASizes.spaceBtwInputFields,),
                    CheckBox(),
                    SizedBox(height: ASizes.defaultSpace),
                    SignUpButton(),
                    SizedBox(height: ASizes.defaultSpace),
                    OrSignInWith(),
                    SizedBox(height: ASizes.defaultSpace),
                    SocialButtons()
                    
                  ],
                ))
              ],
          ),
        ),
          ),
        );
  }
}
//Social button class
class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(border: Border.all(color: AColors.grey), borderRadius: BorderRadius.circular(100)),
            child: IconButton(onPressed: (){}, icon: Image(
              height: 20,
              width: 20,
              image: AssetImage(
                  AImages.google
              ),
            ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: AColors.grey), borderRadius: BorderRadius.circular(100)),
            child: IconButton(onPressed: (){}, icon: Image(
              height: 20,
              width: 20,
              image: AssetImage(
                  AImages.facebook
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
//Option to sign up with different login providers
class OrSignInWith extends StatelessWidget {
  const OrSignInWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Divider(color: dark? AColors.darkGrey: AColors.grey,thickness: 0.5,indent: 60,endIndent: 1,)),
            Text(ATexts.signinwith, style: Theme.of(context).textTheme.bodyMedium,),
            Flexible(
                child: Divider(color: dark? AColors.darkGrey: AColors.grey,thickness: 0.5,indent: 60,endIndent: 1,)),
            SizedBox(height: ASizes.spaceBtwInputFields,),
          ]
      ),
    );
  }
}
//Check box prompting the user to agree to our terns and conditions
class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: dark? AColors.light: AColors.dark,
          child: SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(value: true, onChanged: (value){})),
        ),
        SizedBox(width: ASizes.defaultSpace),
        Expanded(child: Text(ATexts.terms, style: Theme.of(context).textTheme.bodySmall)),
        SizedBox(height: ASizes.defaultSpace),
      ],
    );
  }
}
//Sign button class
class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return SizedBox(
      width: double.infinity,
      child: Container(
        // color: dark ? AColors.light: AColors.dark,
        child: ElevatedButton(onPressed: ()=> Get.to(()=>EmailVerificationPage()), child: Text(ATexts.signUp)),
      ),
    );
  }
}
//Password class
class Password extends StatelessWidget {
  const Password({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.visibility_off_outlined),
        prefixIcon: Icon(Icons.password_sharp),
        labelText: ATexts.password,
      ),
    );
  }
}
//Phone field class
class Phone extends StatelessWidget {
  const Phone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        labelText: ATexts.phoneNo,
      ),
    );
  }
}
//Email field class
class Email extends StatelessWidget {
  const Email({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: ATexts.email,
      ),
    );
  }
}
//Username field class
class Username extends StatelessWidget {
  const Username({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        labelText: ATexts.username,
      ),
    );
  }
}
//Lastname field class
class LastName extends StatelessWidget {
  const LastName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_sharp),
          labelText: ATexts.lastName,
        ),
      ),
    );
  }
}
//First name field class
class FirstName extends StatelessWidget {
  const FirstName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_sharp),
          labelText: ATexts.firstName,
        ),
      ),
    );
  }
}
