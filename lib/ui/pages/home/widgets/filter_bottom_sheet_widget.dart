import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_show_case/core/cubits/app/app_cubit.dart';
import 'package:product_show_case/core/cubits/home/home_cubit.dart';
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
  bool all = true;

  @override
  void initState() {
    final homeState = context.read<HomeCubit>().state;
    if (homeState is HomeLoadedState) {
      newest = homeState.newProduct;
      oldest = homeState.oldProduct;
      priceHighLow = homeState.highLow;
      priceLowHigh = homeState.lowHigh;
      bestSelling = homeState.bestSale;
    }

    super.initState();
  }

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomCheckBoxTile(
                    label: 'All',
                    value: all,
                    onChanged: (newValue) {
                      setState(() {
                        all = newValue ?? all;
                        if (all) {
                          newest = false;
                          oldest = false;
                          priceHighLow = false;
                          priceLowHigh = false;
                          bestSelling = false;
                        }
                      });
                    },
                  ),
                  CustomCheckBoxTile(
                    label: 'Newest',
                    value: newest,
                    onChanged: (newValue) {
                      setState(() {
                        all = false;
                        newest = newValue ?? newest;
                        if (newest) oldest = false;
                      });
                    },
                  ),
                  CustomCheckBoxTile(
                    label: 'Oldest',
                    value: oldest,
                    onChanged: (newValue) {
                      setState(() {
                        all = false;
                        oldest = newValue ?? oldest;
                        if (oldest) {
                          newest = false;
                        }
                      });
                    },
                  ),
                  CustomCheckBoxTile(
                    label: 'Price low> high',
                    value: priceLowHigh,
                    onChanged: (newValue) {
                      setState(() {
                        priceLowHigh = newValue ?? priceLowHigh;
                        if (priceLowHigh) {
                          priceHighLow = false;
                        }
                      });
                    },
                  ),
                  CustomCheckBoxTile(
                    label: 'Price high> low',
                    value: priceHighLow,
                    onChanged: (newValue) {
                      setState(() {
                        priceHighLow = newValue ?? priceHighLow;
                        if (priceHighLow) {
                          priceLowHigh = false;
                        }
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
                            context.read<HomeCubit>().getFilterProducts(
                                  newProduct: newest,
                                  oldProduct: oldest,
                                  highLow: priceHighLow,
                                  lowHigh: priceLowHigh,
                                  bestSale: bestSelling,
                                );
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
            ),
          ),
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
