import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:skillswap/api_models/educator_list.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class EducatorDescription extends StatelessWidget {
  final Educator educator;
  const EducatorDescription({
    super.key,
    required this.educator,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // select attributes and description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              const TSectionHeading(
                  title: 'Description', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              ReadMoreText(
                educator.description,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' show more',
                trimExpandedText: ' less',
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                lessStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
      ],
    );
  }
}
