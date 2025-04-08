import 'package:a_shop/utilis/constants/text_Strings.dart';
import 'package:a_shop/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:a_shop/utilis/constants/image_strings.dart';
import '../../../utilis/constants/colors.dart';
import '../../../utilis/constants/size.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding:
        EdgeInsets.only(
          top: ASizes.appBarHeight,
          left: ASizes.defaultSpace,
          right: ASizes.defaultSpace,
          bottom: ASizes.defaultSpace,
        ),
          child: Column(
            children: [
              Column(
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
                      TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email), labelText: ATexts.email,),
                          ),
                      SizedBox(height: ASizes.spaceBtwInputFields,),
                      //Password
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          prefixIcon: Icon(Icons.password), labelText: ATexts.password,),
                      ),
                      SizedBox(height: ASizes.spaceBtwInputFields,),
                      //Remember me and forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Row(
                          children: [
                          //Remember me
                            Checkbox(
                              value: true,
                              onChanged: (value) {},

                              // This controls the ✔️ checkmark color
                              checkColor: dark ? AColors.primary : AColors.black,

                              // This controls the background of the checkbox
                              fillColor: MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return dark ? AColors.black : AColors.primary;
                                  }
                                  return Colors.grey.shade300; // default for unselected
                                },
                              ),
                            ),

                            Text(ATexts.rememberMe),
                          ]),
                          TextButton(onPressed: (){}, child: Text('Forgot Password'))
                        ],
                      ),
                      SizedBox(height: ASizes.spaceBtwInputFields,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){}, child: Text(ATexts.signIn)),
                      ),
                      SizedBox(height: ASizes.spaceBtwInputFields,),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(onPressed: (){}, child: Text(ATexts.createAccount)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
