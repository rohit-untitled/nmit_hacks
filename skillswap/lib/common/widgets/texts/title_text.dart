import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
    this.largeSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });
  final String title;
  final bool largeSize;
  final int maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: largeSize
          ? Theme.of(context).textTheme.headlineSmall
          : Theme.of(context).textTheme.titleLarge,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
