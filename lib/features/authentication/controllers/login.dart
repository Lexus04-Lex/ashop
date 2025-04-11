import 'package:a_shop/features/authentication/controllers/forgot_password.dart';
import 'package:a_shop/features/authentication/controllers/signup.dart';
import 'package:a_shop/navigation_menu.dart';
import 'package:a_shop/utilis/constants/text_Strings.dart';
import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:a_shop/utilis/constants/image_strings.dart';
import 'package:get/get.dart';
import '../../../utilis/constants/colors.dart';
import '../../../utilis/constants/size.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding1(dark: dark),
      ),
    );
  }
}

class Padding1 extends StatelessWidget {
  const Padding1({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(padding:
    EdgeInsets.only(
      top: ASizes.appBarHeight,
      left: ASizes.defaultSpace,
      right: ASizes.defaultSpace,
      bottom: ASizes.defaultSpace,
    ),
      child: Column(
        children: [
          Logo(dark: dark),
        ],
      ),
    );
  }
}
//Holding all Sign in info
class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image(
              height: 100,
              width: 100,
              image: AssetImage( dark ? AImages.lightAppLogo: AImages.darkAppLogo)),
        ),
        Text(ATexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
        SizedBox(height: ASizes.spaceBtwItems,),
        Text(ATexts.loginSubtitle, style: Theme.of(context).textTheme.headlineMedium,),
        SizedBox(height: ASizes.spaceBtwItems,),
        //Log in Form
        Form(child: Column(
          children: [
            //Email
            LoginHandle1(),
            SizedBox(height: ASizes.spaceBtwInputFields,),
            //Password
            LoginHandle2(),
            SizedBox(height: ASizes.spaceBtwInputFields,),
            //Remember me and forgot password
            SocialButtons(dark: dark),
            SizedBox(height: ASizes.spaceBtwInputFields,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: ()=>Get.to(()=>NavigationMenuPage()), child: Text(ATexts.signIn)),
            ),
            SizedBox(height: ASizes.spaceBtwInputFields,),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: ()=> Get.offAll(()=> SignUpScreen()),
                  child: Text(ATexts.createAccount)),
            ),
            SizedBox(height: ASizes.spaceBtwInputFields,),
            Row(
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
            SizedBox(height: ASizes.spaceBtwInputFields,),
            Center(
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
            )
          ],
        ))
      ],
    );
  }
}

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        //Remember me
        RememberMe(dark: dark),
        TextButton(onPressed: ()=>Get.to(()=>ForgotPassword()), child: Text('Forgot Password'))
      ],
    );
  }
}

class RememberMe extends StatelessWidget {
  const RememberMe({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
    //Remember me
      Checkbox(
        value: true,
        onChanged: (value) {},
    
        // This controls the ✔️ checkmark color
        checkColor: dark ? AColors.primary : AColors.black,
    
        // This controls the background of the checkbox
        fillColor: WidgetStateProperty.resolveWith<Color>(
              (states) {
            if (states.contains(WidgetState.selected)) {
              return dark ? AColors.black : AColors.primary;
            }
            return Colors.grey.shade300; // default for unselected
          },
        ),
      ),
    
      Text(ATexts.rememberMe),
    ]);
  }
}

class LoginHandle2 extends StatelessWidget {
  const LoginHandle2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.visibility_off),
        prefixIcon: Icon(Icons.password), labelText: ATexts.password,),
    );
  }
}

class LoginHandle1 extends StatelessWidget {
  const LoginHandle1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email), labelText: ATexts.email,),
        );
  }
}
