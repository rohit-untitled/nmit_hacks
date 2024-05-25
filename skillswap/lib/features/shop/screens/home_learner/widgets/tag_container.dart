import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TagContainer extends StatelessWidget {
  const TagContainer({
    super.key,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                color: TColors.white,
                
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 4),
            SizedBox(
              width: 105,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
