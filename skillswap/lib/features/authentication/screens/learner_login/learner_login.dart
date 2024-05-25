import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skillswap/features/authentication/screens/learner_login/widgets/learner_login_form.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../login/widgets/login_header.dart';

class LearnerLogin extends StatelessWidget {
  const LearnerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // logo, title and sub-title
              SvgPicture.asset(TImages.skillSwap, height: 120),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TLoginHeader(),

              // Learner login Form
              const LearnerLoginForm(),
              // Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
