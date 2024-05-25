import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillswap/common/widgets/texts/price_text.dart';
import 'package:skillswap/common/widgets/texts/section_heading.dart';
import 'package:skillswap/common/widgets/texts/title_text.dart';
import '../../../../../api_models/sessions_list.dart';
import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../common/widgets/texts/tags_text_educator_details.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class AlertDialogNotification extends StatelessWidget {
  final Session session;

  const AlertDialogNotification({Key? key, required this.session})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TCircularImage(
                  image: TImages.user,
                  width: 100,
                  height: 100,
                  padding: 0,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text(
                  'Session ${session.id}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                TitleText(title: session.educator),
                Text(
                  'Duration: ${session.duration} mins',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                PriceText(price: session.price, isLarge: true),
                const SizedBox(height: TSizes.spaceBtwItems),
                TagTextsEducatorDetails(
                  tags: session.tags,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Divider(),
                const TSectionHeading(
                    title: 'Description', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  session.problemDescription,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey.shade600),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  'Status: ${session.sessionStatus}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.green.shade800),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0.0,
            child: IconButton(
              icon: const Icon(Iconsax.close_circle5),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
