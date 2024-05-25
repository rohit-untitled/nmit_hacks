// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:skillswap/features/shop/screens/all_educators/all_educators.dart';
// import 'package:skillswap/features/shop/screens/home/widgets/home_categories.dart';
// import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
// import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
// import '../../../../common/widgets/layouts/grid_layout.dart';
// import '../../../../common/widgets/products/products_cards/educator_card_vertical.dart';
// import '../../../../common/widgets/texts/section_heading.dart';
// import '../../../../fetch_api/educators.dart';
// import '../../../../fetch_api/tags.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../api_models/banner_tag.dart';
// import '../../../../api_models/educator_list.dart';
// import '../home/widgets/home_appbar.dart';
// import '../home/widgets/promo_slider_educator.dart';

// class HomeLearner extends StatefulWidget {
//   const HomeLearner({super.key});

//   @override
//   State<HomeLearner> createState() => _HomeLearnerState();
// }

// class _HomeLearnerState extends State<HomeLearner> {
//   late Future<List<Tag>> futureTags;
//   late Future<List<Educator>> futureEducators;

//   @override
//   void initState() {
//     super.initState();
//     futureTags = fetchTags();
//     futureEducators = fetchEducators();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // header
//             const TPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   // app bar
//                   const THomeAppBar(),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   // search bar
//                   const TSearchContainer(text: 'Search skills, educators...'),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   // categories
//                   Padding(
//                     padding: const EdgeInsets.only(left: TSizes.defaultSpace),
//                     child: Column(
//                       children: [
//                         // heading
//                         const TSectionHeading(
//                           title: 'Popular Categories',
//                           showActionButton: false,
//                           textColor: TColors.dark,
//                         ),
//                         const SizedBox(height: TSizes.spaceBtwItems),

//                         // tags from the api request

//                         // FutureBuilder<List<Tag>>(
//                         //   future: futureTags,
//                         //   builder: (context, snapshot) {
//                         //     if (snapshot.connectionState ==
//                         //         ConnectionState.waiting) {
//                         //       return const Center(
//                         //           child: CircularProgressIndicator());
//                         //     } else if (snapshot.hasError) {
//                         //       return Center(
//                         //           child: Text('Error: ${snapshot.error}'));
//                         //     } else if (!snapshot.hasData ||
//                         //         snapshot.data!.isEmpty) {
//                         //       return const Center(
//                         //           child: Text('No categories to show'));
//                         //     } else {
//                         // return THomeCategories(tags: snapshot.data!);
//                         //     }
//                         //   },
//                         // ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwSections),
//                 ],
//               ),
//             ),

//             // body
//             Padding(
//               padding: const EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   const PromoSliderEducator(
//                     banners: [
//                       TImages.lea1,
//                       TImages.lea2,
//                       TImages.lea3,
//                     ],
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   // headings
//                   TSectionHeading(
//                     title: 'Popular Educators',
//                     onPressed: () => Get.to(() => const AllEducators()),
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   // popular educators
//                   FutureBuilder<List<Educator>>(
//                     future: futureEducators,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return Center(child: Text('Error: ${snapshot.error}'));
//                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                         return const Center(child: Text('No educators found'));
//                       } else {
//                         return TGridLayout(
//                           // itemCount: snapshot.data!.length,
//                           itemCount: 4,
//                           itemBuilder: (_, index) => EducatorCardVertical(
//                               educator: snapshot.data![index]),
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/features/shop/screens/all_educators/all_educators.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/products_cards/educator_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../fetch_api/educators.dart';
import '../../../../fetch_api/tags.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../api_models/banner_tag.dart';
import '../../../../api_models/educator_list.dart';
import '../home/widgets/home_appbar.dart';
import '../home/widgets/promo_slider_educator.dart';
import 'widgets/tag_slider.dart';

class HomeLearner extends StatefulWidget {
  const HomeLearner({Key? key}) : super(key: key);

  @override
  State<HomeLearner> createState() => _HomeLearnerState();
}

class _HomeLearnerState extends State<HomeLearner> {
  late Future<List<Tag>> futureTags;
  late Future<List<Educator>> futureEducators;

  @override
  void initState() {
    super.initState();
    futureTags = fetchTags();
    futureEducators = fetchEducators();
  }

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
                  TSearchContainer(text: 'Search skills, educators...'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace / 2),
                    child: Column(
                      children: [
                        // heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.dark,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        // categories

                        TagSliderWidget(),
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
                  const PromoSliderEducator(
                    banners: [
                      TImages.lea1,
                      TImages.lea2,
                      TImages.lea3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // headings
                  TSectionHeading(
                    title: 'Popular Educators',
                    onPressed: () => Get.to(() => const AllEducators()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // popular educators
                  FutureBuilder<List<Educator>>(
                    future: futureEducators,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No educators found'));
                      } else {
                        return TGridLayout(
                          // itemCount: snapshot.data!.length,
                          itemCount: 4,
                          itemBuilder: (_, index) => EducatorCardVertical(
                              educator: snapshot.data![index]),
                        );
                      }
                    },
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
