import 'package:flutter/material.dart';

import 'package:product_show_case/ui/theme/colors.dart';

class CommonBorder extends StatelessWidget {
  const CommonBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: hintColor.withOpacity(0.4),
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
