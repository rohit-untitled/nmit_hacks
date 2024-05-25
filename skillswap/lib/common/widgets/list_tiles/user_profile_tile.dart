import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillswap/utils/constants/global.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(usernameGlobal,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.black)),
      subtitle: Text(
        'rohit.untitled@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.black),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
