import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillswap/api_models/educator_list.dart';
import 'package:skillswap/common/widgets/texts/price_text.dart';
import 'package:skillswap/common/widgets/texts/title_text.dart';
import 'package:skillswap/features/shop/screens/educator_details/widgets/educator_description.dart';
import 'package:skillswap/features/shop/screens/time_slots/timeslot_screen.dart';
import '../../../../common/widgets/custom_buttons/custom_button.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/texts/tags_text_educator_details.dart';
import '../../../../utils/constants/sizes.dart';
import '../educator_reviews.dart/educator_review.dart';
import '../product_details/widgets/rating_share_widget.dart';
import 'widgets/educator_detail_image.dart';

class EducatorDetails extends StatelessWidget {
  final Educator educator;
  const EducatorDetails({
    super.key,
    required this.educator,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // educator image
            const EducatorImage(),

            //educator details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating and share button
                  const TRatingAndShare(),
                  // educator name and session costs
                  // const TProductMetaData(),
                  TitleText(title: educator.name, largeSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 4),
                  PriceText(price: educator.charges.toString(), isLarge: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 4),
                  // tags of the educator
                  TagTextsEducatorDetails(
                    tags: educator.tags,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // description
                  EducatorDescription(educator: educator),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // book your time slot button
                  CustomButton(
                    onPressed: () => Get.to(() => TimeSlots(
                          educator: educator,
                        )),
                    text: 'Book your time slots',
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                          title: 'Reviews(199)',
                          showActionButton: false,
                          onPressed: () {}),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const EducatorReviewScreen()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
