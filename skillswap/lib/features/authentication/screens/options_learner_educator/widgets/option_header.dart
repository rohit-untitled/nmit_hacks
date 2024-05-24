import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skillswap/utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class OptionHeader extends StatelessWidget {
  const OptionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: TSizes.spaceBtwSections * 2),
        SvgPicture.asset(TImages.skillSwap, height: 120),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text('Swifly change your roles',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: TSizes.sm),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: const [
              TextSpan(
                text: 'Peer-to-Peer  ',
                style: TextStyle(
                    color: TColors.secondary,
                    fontWeight: FontWeight.bold), // Change the color here
              ),
              TextSpan(
                  text: 'tutoring right from your phone',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
