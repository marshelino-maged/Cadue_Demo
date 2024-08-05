import 'package:demo_project/data/models/product_model.dart';
import 'package:demo_project/data/repositories/products_repo.dart';
import 'package:demo_project/presentation/screens/products/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsViewModel {

  ProductsViewModel({required typeId}):_typeId = typeId;

  //constants
  final _gridController = ScrollController();
  final _repo = ProductsRepo();
  final int _typeId;
  final int _pageSize = 6;
  get controller => _gridController;

  //variables
  var _currentPage = 1;

  //providers
  final hasNext = StateProvider<bool>((ref) => true);
  final products =
      StateNotifierProvider<ProductsStateNotifier, List<ProductModel>>(
          (ref) => ProductsStateNotifier());

  //functions
  void init(WidgetRef ref) {
    _gridController.addListener(() {
      if (_gridController.position.pixels ==
          _gridController.position.maxScrollExtent) {
        _loadMoreData(ref);
      }
    });
    _loadMoreData(ref);
  }

  void _loadMoreData(WidgetRef ref) async {
    if (ref.read(hasNext)) {
      List<ProductModel>? newProducts =
          await _repo.getProducts(_currentPage, _typeId);
      if (newProducts == null) return;
      if (newProducts.isEmpty || newProducts.length < _pageSize) ref.read(hasNext.notifier).state = false;
      if (newProducts.isNotEmpty) _currentPage++;
      ref.read(products.notifier).addProducts(newProducts);
    }
  }

  void showDetails(BuildContext context,
      {required int productId}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          DetailsScreen(productId: productId),
    ));
  }
}

class ProductsStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductsStateNotifier() : super([]);

  void addProducts(List<ProductModel> newProducts) {
    state = [...state, ...newProducts];
  }
}