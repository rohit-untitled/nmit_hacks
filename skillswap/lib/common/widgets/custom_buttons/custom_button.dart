import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.secondary,
            side: const BorderSide(color: Colors.transparent),
          ),
          onPressed: onPressed,
          child: Text(text),
        ));
  }
}
