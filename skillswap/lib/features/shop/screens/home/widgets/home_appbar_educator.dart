import 'package:flutter/material.dart';
import 'package:skillswap/utils/constants/global.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';

class EducatorHomeAppbar extends StatelessWidget {
  const EducatorHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome,',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.black)),
          Text(usernameGlobal,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .apply(color: TColors.black)),
        ],
      ),
    );
  }
}
