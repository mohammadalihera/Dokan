import 'package:flutter/material.dart';

import 'package:product_show_case/core/model/product/product.dart';
import 'package:product_show_case/ui/pages/home/widgets/rating_widget.dart';
import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';
import 'package:product_show_case/ui/widgets/index.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: CommonImageView(url: product.images![0].src),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              product.name,
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: normalTextStyle.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '\$${product.regular_price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: hintColor,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: hintColor,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10),
            child: Row(children: [
              RatingWidget(color: double.parse(product.average_rating ?? "0") > 0 ? Colors.orange : hintColor),
              RatingWidget(color: double.parse(product.average_rating ?? "0") > 1 ? Colors.orange : hintColor),
              RatingWidget(color: double.parse(product.average_rating ?? "0") > 2 ? Colors.orange : hintColor),
              RatingWidget(color: double.parse(product.average_rating ?? "0") > 3 ? Colors.orange : hintColor),
              RatingWidget(color: double.parse(product.average_rating ?? "0") > 4 ? Colors.orange : hintColor),
            ]),
          ),
        ],
      ),
    );
  }
}
