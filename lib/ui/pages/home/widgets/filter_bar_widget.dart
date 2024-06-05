import 'package:flutter/material.dart';

import 'package:product_show_case/ui/shared/image_path.dart';
import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';
import 'package:product_show_case/ui/widgets/common_image_view.dart';

import 'filter_bottom_sheet_widget.dart';

class FilterBarWidget extends StatelessWidget {
  const FilterBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(2, 3), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Row(
              children: [
                const SizedBox(width: 10),
                CommonImageView(svgPath: ImagePath.filter),
                const SizedBox(width: 10),
                Text(
                  'Filter',
                  style: normalTextStyle.copyWith(fontSize: 16, color: grey),
                ),
              ],
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const FilterBottomSheetWidget();
                },
              );
            },
          ),
          Row(
            children: [
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'sort',
                      child: Text('Sort by'),
                    ),
                    // Add more menu items as needed
                  ];
                },
                onSelected: (String choice) {
                  // Handle sort action
                },

                child: Row(children: [
                  Text(
                    'Sort by',
                    style: normalTextStyle.copyWith(color: grey, fontSize: 16),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: grey)
                ]), // "More" icon
              ),
              const SizedBox(width: 10),
              CommonImageView(svgPath: ImagePath.more),
              const SizedBox(width: 10)
            ],
          ),
        ],
      ),
    );
  }
}
