import 'package:flutter/material.dart';

import 'package:product_show_case/ui/theme/thems.dart';

class CustomCancelButton extends StatelessWidget {
  const CustomCancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 61,
      child: ElevatedButton(
        onPressed: () {
          // Handle cancel button action
          Navigator.of(context).pop();
        },
        style: Themes.borderButtonStyle(),
        child: const Text('Cancel'),
      ),
    );
  }
}
