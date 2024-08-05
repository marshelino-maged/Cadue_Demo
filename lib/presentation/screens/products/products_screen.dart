import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/presentation/screens/products/products_view_model.dart';
import 'package:demo_project/presentation/widgets/common/back_arrow.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:demo_project/presentation/widgets/product/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  ProductsScreen(
      {super.key, required this.title, required this.occasionId}):_viewModel = ProductsViewModel(typeId: occasionId);
  final String title;
  final int occasionId;
  final ProductsViewModel _viewModel;

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    widget._viewModel.init(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackArrow(),
        title: StyledText(
          widget.title,
          fontSize: 14,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsGetter.black26, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Image.asset(ImagesGetter.discountIcon),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          'Top offers for ${widget.title}',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                        StyledText(
                          'Discover top offers for ${widget.title}’s gift and save money',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(ImagesGetter.goIcon),
                  ],
                ),
              ),
              Expanded(
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final products = ref.watch(widget._viewModel.products);
                    final hasNext = ref.watch(widget._viewModel.hasNext);
                    return GridView.builder(
                      controller: widget._viewModel.controller,
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: products.length + 1,
                      itemBuilder: (context, index) {
                        if (index == products.length) {
                          return hasNext
                              ? const Center(
                                  child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(),
                                ))
                              : null;
                        }
                        return InkWell(
                          onTap: () {
                            widget._viewModel.showDetails(context,
                                productId: products[index].id!);
                          },
                          child: ProductItem(
                            product: products[index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 45,
                width: 230,
                decoration: BoxDecoration(
                  color: ColorsGetter.white255,
                  border: Border.all(color: ColorsGetter.black26, width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: const StyledText('Sort by'),
                      icon: Image.asset(ImagesGetter.sortIcon),
                    ),
                    VerticalDivider(
                      color: ColorsGetter.black26,
                      thickness: 2,
                      width: 0,
                      indent: 10,
                      endIndent: 10,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: const StyledText('Filter by'),
                      icon: Image.asset(ImagesGetter.filterIcon),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
