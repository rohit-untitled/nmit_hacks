
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/common/widgets/login_signup/form_divider.dart';

import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // title
            Text(TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwSections),
            // form
            const TSignupForm(),
            const SizedBox(height: TSizes.spaceBtwSections),

            //Divider
            TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),
            // social buttons
            const TSocialButtons(),
          ]),
        ),
      ),
    );
  }
}
