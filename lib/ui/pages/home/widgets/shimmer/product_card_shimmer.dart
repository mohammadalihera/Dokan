import 'package:flutter/material.dart';

import 'package:product_show_case/ui/pages/home/widgets/rating_widget.dart';
import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/widgets/common_shimmer_widget.dart';

class ProductShimmerCard extends StatelessWidget {
  const ProductShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: CommonShimmerWidget(
                height: 200,
                width: size.width * 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 0),
                borderRadius: 0,
              ),
            ),
          ),
          CommonShimmerWidget(
            height: 25,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            borderRadius: 0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonShimmerWidget(
                  height: 25,
                  width: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  borderRadius: 0,
                ),
                const SizedBox(width: 10),
                CommonShimmerWidget(
                  height: 25,
                  width: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  borderRadius: 0,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10),
            child: const Row(children: [
              RatingWidget(color: hintColor),
              RatingWidget(color: hintColor),
              RatingWidget(color: hintColor),
              RatingWidget(color: hintColor),
              RatingWidget(color: hintColor),
            ]),
          ),
        ],
      ),
    );
  }
}
