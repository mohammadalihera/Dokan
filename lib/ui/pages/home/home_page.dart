import 'package:flutter/material.dart';

import 'package:product_show_case/ui/pages/home/widgets/filter_bar_widget.dart';
import 'package:product_show_case/ui/shared/image_path.dart';
import 'package:product_show_case/ui/theme/text_style.dart';
import 'package:product_show_case/ui/widgets/common_image_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products List',
          style: boldTextStyle.copyWith(fontSize: 23),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: CommonImageView(svgPath: ImagePath.search),
            ),
          ),
        ],
      ),
      body: const Column(children: [FilterBarWidget()]),
    );
  }
}
