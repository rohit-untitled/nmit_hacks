import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class EducatorImage extends StatelessWidget {
  const EducatorImage({super.key});
 @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: const Stack(
          children: [
            // main large image
            SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child:
                      Center(child: Image(image: AssetImage(TImages.educator))),
                )),

            //Appbar icons
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}