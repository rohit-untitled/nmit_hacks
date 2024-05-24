import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillswap/utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
            elevation: 2,
            shape: const CircleBorder(),
            backgroundColor: TColors.secondary,
            side: BorderSide.none,
          ),
          child: const Icon(
            Iconsax.arrow_right_3,
          )),
    );
  }
}
