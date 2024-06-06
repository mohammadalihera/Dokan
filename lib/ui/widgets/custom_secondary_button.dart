import 'package:flutter/material.dart';

import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';

class CustomSecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;
  const CustomSecondaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
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
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isLoading) Text(label),
            if (isLoading)
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                  backgroundColor: Colors.black,
                ),
              )
          ],
        ),
      ),
    );
  }
}
