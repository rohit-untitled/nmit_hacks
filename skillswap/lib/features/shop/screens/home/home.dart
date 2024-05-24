import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/features/shop/screens/all_educators/all_educators.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/products_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/home_appbar.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // app bar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // search bar
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        // categories
                        // THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // promo slider
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // headings
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllEducators()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  //popular products

                  TGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const TProductCartVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
