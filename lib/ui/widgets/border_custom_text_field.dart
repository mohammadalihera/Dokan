import 'package:flutter/material.dart';

import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';

class BorderCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool readOnly;

  const BorderCustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: regularTextStyle.copyWith(color: hintColor),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor.withOpacity(0.12)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor.withOpacity(0.12)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor.withOpacity(0.12)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
