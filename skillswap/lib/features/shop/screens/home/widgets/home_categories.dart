// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:skillswap/utils/constants/image_strings.dart';

// import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';
// import '../../sub_category/sub_categories.dart';
// import '../../../../../api_models/banner_tag.dart';

// class THomeCategories extends StatelessWidget {
//   final List<Tag> tags;

//   const THomeCategories({super.key, required this.tags});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: tags.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (_, index) {
//             return TVerticalImageText(
//               image: TImages.shoeIcon,
//               title: tags[index].name,
//               onTap: () => Get.to(() => const SubCategoriesScreen()),
//             );
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:skillswap/features/shop/screens/home_learner/widgets/tag_container.dart';

class THomeCategories extends StatelessWidget {
  final List<CategoryData> categories;
  const THomeCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TagContainer(
              image: categories[index].image,
              title: categories[index].title,
              onTap: categories[index].onTap,
            );
          }),
    );
  }
}


class CategoryData {
  final String image;
  final String title;
  final VoidCallback onTap;

  CategoryData({required this.image, required this.title, required this.onTap});
}