import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:product_show_case/ui/shared/image_path.dart';
import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/widgets/common_image_view.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      padding: const EdgeInsets.all(10),
      strokeWidth: 1,
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
