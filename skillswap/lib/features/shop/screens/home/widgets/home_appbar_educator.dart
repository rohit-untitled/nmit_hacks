import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

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
          Text('NerdHeads',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .apply(color: TColors.black)),
        ],
      ),
    );
  }
}
