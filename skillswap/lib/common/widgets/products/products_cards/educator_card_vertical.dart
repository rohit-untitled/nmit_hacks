import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/common/widgets/texts/price_text.dart';
import 'package:skillswap/common/widgets/texts/title_text.dart';
import 'package:skillswap/features/shop/screens/educator_details/educator_details.dart';
import '../../../../api_models/educator_list.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/t_rounded_images.dart';
import '../../texts/tags_text.dart';

class EducatorCardVertical extends StatelessWidget {
  final Educator educator;

  const EducatorCardVertical({Key? key, required this.educator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => EducatorDetails(educator: educator)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: const Stack(
                children: [
                  TRoundedImage(
                    imageUrl: TImages.educator,
                    applyImageRadius: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // educator name
                  TitleText(
                    title: educator.name,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 4),
                  // Display educator's tags

                  TagsTexts(
                    tags: educator.tags,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 4),

                  // sessions price
                  PriceText(price: educator.charges.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
