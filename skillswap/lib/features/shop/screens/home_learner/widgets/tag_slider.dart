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
          image: TImages.gardening,
          title: 'Gardening',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.petcare,
          title: 'PetCare',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.music,
          title: 'Musicians',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.studies,
          title: 'Higher Studies',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.pilates,
          title: 'Pilates',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.baking,
          title: 'Baking',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.maternity,
          title: 'Maternity',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.homedecor,
          title: 'Home Decor',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
        CategoryData(
          image: TImages.intimacy,
          title: 'Intimacy',
          onTap: () => Get.to(() => const SubCategoriesScreen()),
        ),
      ],
    );
  }
}
