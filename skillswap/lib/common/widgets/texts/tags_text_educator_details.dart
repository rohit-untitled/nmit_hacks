import 'package:flutter/material.dart';

class TagTextsEducatorDetails extends StatelessWidget {
  const TagTextsEducatorDetails({
    super.key,
    this.textAlign,
    required this.tags,
    this.style,
  });

  final TextAlign? textAlign;
  final List<String> tags;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: tags.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            tag,
            style: style ?? Theme.of(context).textTheme.bodySmall,
          ),
        );
      }).toList(),
    );
  }
}
