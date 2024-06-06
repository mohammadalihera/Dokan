import 'package:flutter/material.dart';

import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';

class CustomSecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const CustomSecondaryButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 61,
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(semiboldTextStyle),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          backgroundColor: const MaterialStatePropertyAll(secondaryColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
