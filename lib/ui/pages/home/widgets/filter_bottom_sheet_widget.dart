import 'package:flutter/material.dart';
import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';
import 'package:product_show_case/ui/theme/thems.dart';
import 'package:product_show_case/ui/widgets/index.dart';

class FilterBottomSheetWidget extends StatefulWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  State<FilterBottomSheetWidget> createState() => _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  bool newest = false;
  bool oldest = false;
  bool priceLowHigh = false;
  bool priceHighLow = false;
  bool bestSelling = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter Options',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    // Close the bottom sheet
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          CustomCheckBoxTile(
            label: 'Newest',
            value: newest,
            onChanged: (newValue) {
              setState(() {
                newest = newValue ?? newest;
              });
            },
          ),
          CustomCheckBoxTile(
            label: 'Oldest',
            value: oldest,
            onChanged: (newValue) {
              setState(() {
                oldest = newValue ?? oldest;
              });
            },
          ),
          CustomCheckBoxTile(
            label: 'Price low> high',
            value: priceLowHigh,
            onChanged: (newValue) {
              setState(() {
                priceLowHigh = newValue ?? priceLowHigh;
              });
            },
          ),
          CustomCheckBoxTile(
            label: 'Price high> low',
            value: priceHighLow,
            onChanged: (newValue) {
              setState(() {
                priceHighLow = newValue ?? priceHighLow;
              });
            },
          ),
          CustomCheckBoxTile(
            label: 'Best selling',
            value: bestSelling,
            onChanged: (newValue) {
              setState(() {
                bestSelling = newValue ?? bestSelling;
              });
            },
          ),
          // Add more checkboxes as needed
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomCancelButton(),
              SizedBox(
                width: 155,
                height: 61,
                child: ElevatedButton(
                  style: Themes.filledButtonStyle(secondaryColor),
                  onPressed: () {
                    // Handle apply button action
                    Navigator.of(context).pop();
                  },
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class CustomCheckBoxTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  const CustomCheckBoxTile({super.key, required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              side: BorderSide(color: theme.primaryColor),
              activeColor: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              value: value,
              onChanged: onChanged,
            ),
          ),
          Text(label, style: regularTextStyle),
        ],
      ),
    );
  }
}
