import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillswap/api_models/educator_list.dart';
import 'package:skillswap/common/widgets/texts/title_text.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class Timings extends StatelessWidget {
  final Educator educator;
  final bool selected;
  final VoidCallback onTap;

  const Timings({
    super.key,
    required this.selected,
    required this.educator,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        width: double.infinity,
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor:
            selected ? TColors.secondary.withOpacity(0.4) : Colors.transparent,
        borderColor: selected
            ? Colors.transparent
            : dark
                ? TColors.darkerGrey
                : TColors.grey,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Stack(
          children: [
            if (selected)
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  Iconsax.tick_circle5,
                  color: dark
                      ? TColors.light
                      : TColors.dark.withOpacity(0.6),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(title: educator.name),
                const SizedBox(height: TSizes.sm / 2),
                Text(
                  'Timings : Mon-Tue',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                  softWrap: true,
                ),
                const SizedBox(height: TSizes.sm / 2),
                Text(
                  'Hour : 15 : 30',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                  softWrap: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
