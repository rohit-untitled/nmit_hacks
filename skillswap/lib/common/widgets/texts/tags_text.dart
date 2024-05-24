import 'package:flutter/material.dart';

class TagsTexts extends StatelessWidget {
  const TagsTexts({
    super.key,
    required this.tags,
    this.maxLines = 2,
    this.style,
    this.textAlign = TextAlign.left,
  });
  final int maxLines;
  final TextAlign? textAlign;
  final List<String> tags;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tags: ${tags.join(", ")}',
      maxLines: maxLines,
      textAlign: textAlign,
      style: style ?? Theme.of(context).textTheme.bodySmall,
    );
  }
}
