import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';
import '../product_reviews/widgets/rating_progress_indicator.dart';
import '../product_reviews/widgets/user_review_card.dart';

class EducatorReviewScreen extends StatelessWidget {
  const EducatorReviewScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: TAppBar(
        title: Text(
          'Reviews & Ratings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified from the people who uses the same type of device that you use.'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // overall product ratings
              const TOverallProductRatings(),

              // star
              const TRatingBarIndicator(rating: 3.6),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              //user review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}