import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:product_show_case/core/cubits/home/home_cubit.dart';
import 'package:product_show_case/ui/pages/home/widgets/filter_bar_widget.dart';
import 'package:product_show_case/ui/pages/home/widgets/product_card_widget.dart';
import 'package:product_show_case/ui/shared/image_path.dart';
import 'package:product_show_case/ui/theme/text_style.dart';
import 'package:product_show_case/ui/widgets/common_image_view.dart';

import 'widgets/shimmer/product_card_shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeCubit>().getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          FilterBarWidget(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadedState) {
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemCount: state.productList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(product: state.productList[index]);
                    },
                  ),
                );
              } else if (state is HomeLoadingState) {
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return const ProductShimmerCard();
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('No Products Available'),
                );
              }
            },
          )
        ]),
      ),
    );
  }
}
