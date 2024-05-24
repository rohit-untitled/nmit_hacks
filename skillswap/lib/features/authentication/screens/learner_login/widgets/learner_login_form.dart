import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillswap/common/widgets/custom_buttons/custom_button.dart';
import 'package:skillswap/navigation_menu_learner.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';

class LearnerLoginForm extends StatelessWidget {
  const LearnerLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            //Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remember me and Forget Password,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                // Forget password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            //sign in button

            CustomButton(
              onPressed: () => Get.to(() => const NavigationMenuLearner()),
              text: TTexts.signIn,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            //create account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: TColors.secondary),
                    ),
                    // onPressed: () => Get.to(() => const SignupScreen()),
                    onPressed: () {},
                    child: const Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
