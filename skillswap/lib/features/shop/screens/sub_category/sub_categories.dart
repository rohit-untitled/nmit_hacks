import 'package:flutter/material.dart';

import '../../../../api_models/educator_list.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_rounded_images.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/products_cards/educator_card_vertical.dart';
import '../../../../common/widgets/products/products_cards/product_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../fetch_api/educators.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({super.key});

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  late Future<List<Educator>> futureEducators;

  @override
  void initState() {
    super.initState();
    futureEducators = fetchEducators();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Gardening',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.gardeningbanner,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // sub categories
              Column(
                children: [
                  //heading
                  TSectionHeading(
                    title: 'Gardening',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  // SizedBox(
                  //   height: 120,
                  //   child: ListView.separated(
                  //       itemCount: 4,
                  //       separatorBuilder: (context, index) =>
                  //           const SizedBox(width: TSizes.spaceBtwItems),
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) =>
                  //           const TProductCardHorizontal()),
                  // ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
