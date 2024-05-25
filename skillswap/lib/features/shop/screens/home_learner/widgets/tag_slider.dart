import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../home/widgets/home_categories.dart';
import '../../sub_category/sub_categories.dart';

class TagSliderWidget extends StatelessWidget {
  const TagSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return THomeCategories(
      categories: [
        CategoryData(
          image: TImages.banner2,
          title: 'Category 1',
          onTap: () =>
              Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.banner3,
          title: 'Category 1',
          onTap: () =>
              Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.banner1,
          title: 'Category 1',
          onTap: () =>
              Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.banner4,
          title: 'Category 1',
          onTap: () =>
              Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.banner5,
          title: 'Category 1',
          onTap: () =>
              Get.to(() => const SubCategoriesScreen()),
        ),
      ],
    );
  }
}
