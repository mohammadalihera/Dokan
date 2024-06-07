import 'package:flutter/material.dart';

import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';
import 'package:product_show_case/ui/widgets/index.dart';

class ProfileCard extends StatelessWidget {
  final String label;
  final String icon;
  final bool open;
  final double maxHeight;
  final VoidCallback onTap;
  final Widget? widget;

  const ProfileCard({
    super.key,
    required this.label,
    required this.icon,
    this.open = false,
    this.maxHeight = 100,
    required this.onTap,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: open ? 750 : 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 18),
                  child: CommonImageView(
                    svgPath: icon,
                    color: hintColor,
                    height: 24,
                  ),
                ),
                Text(
                  label,
                  style: regularTextStyle,
                )
              ]),
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  open ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                  color: hintColor,
                  size: 35,
                ),
              )
            ],
          ),
          if (widget != null && open) widget ?? const SizedBox()
        ],
      ),
    );
  }
}
