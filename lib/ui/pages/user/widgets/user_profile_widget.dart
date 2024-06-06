import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:product_show_case/ui/shared/image_path.dart';
import 'package:product_show_case/ui/widgets/common_image_view.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      dashPattern: const [4, 4],
      padding: const EdgeInsets.all(10),
      strokeWidth: 1,
      borderPadding: const EdgeInsets.all(2),
      radius: const Radius.circular(25),
      color: Theme.of(context).primaryColor,
      child: Center(
        child: CommonImageView(
          imagePath: ImagePath.demoProfile,
          height: 100,
        ),
      ),
    );
  }
}
