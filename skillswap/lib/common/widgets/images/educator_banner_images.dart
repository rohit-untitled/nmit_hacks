// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/sizes.dart';

// class EducatorBannerImages extends StatelessWidget {
//   const EducatorBannerImages({
//     super.key,
//     this.width,
//     this.height,
//     required this.imageUrl,
//     this.applyImageRadius = true,
//     this.border,
//     this.backgroundColor = TColors.light,
//     this.fit = BoxFit.contain,
//     this.padding,
//     this.isNetworkImage = false,
//     this.onPressed,
//     this.borderRadius = TSizes.md,
//   });

//   final double? width, height;
//   final String imageUrl;
//   final bool applyImageRadius;
//   final BoxBorder? border;
//   final Color backgroundColor;
//   final BoxFit? fit;
//   final EdgeInsetsGeometry? padding;
//   final bool isNetworkImage;
//   final VoidCallback? onPressed;
//   final double borderRadius;

//   @override
//    Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: width,
//         height: height,
//         padding: padding,
//         decoration: BoxDecoration(
//             border: border,
//             color: backgroundColor,
//             borderRadius: BorderRadius.circular(borderRadius)),
//         child: ClipRRect(
//           borderRadius: applyImageRadius
//               ? BorderRadius.circular(borderRadius)
//               : BorderRadius.zero,
//           // child: Image(
//           //   image: isNetworkImage
//           //       ? NetworkImage(imageUrl)
//           //       : AssetImage(imageUrl) as ImageProvider,
//           //   fit: fit,
//           // ),
//           child: SvgPicture.asset(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class EducatorBannerImages extends StatelessWidget {
  const EducatorBannerImages({
    Key? key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain, 
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  }) : super(key: key);

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit; // Change to non-nullable BoxFit
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: SvgPicture.asset(
            imageUrl,
            fit: fit,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
