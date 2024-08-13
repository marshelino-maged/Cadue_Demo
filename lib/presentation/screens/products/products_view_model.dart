import 'package:demo_project/data/models/product_model.dart';
import 'package:demo_project/data/repositories/products_repo.dart';
import 'package:demo_project/presentation/screens/occasions/occasions_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsViewModel {
  ProductsViewModel();

  //constants
  final _repo = ProductsRepo();
  final int _pageSize = 6;

  //variables
  var _currentPage = 1;

  //providers
  final hasNext = StateProvider<bool>((ref) => true);
  static final selectedProduct = StateProvider<ProductModel?>((ref) => null);
  final products =
      StateNotifierProvider<ProductsStateNotifier, List<ProductModel>>(
          (ref) => ProductsStateNotifier());

  //functions
  Future<void> loadMoreData(WidgetRef ref) async {
    if (ref.read(hasNext)) {
      final occasionId = ref.read(OccasionsViewModel.selectedOccasion)!.id!;
      List<ProductModel>? newProducts =
          await _repo.getProducts(_currentPage, occasionId);
      if (newProducts == null) return;

      if (newProducts.length < _pageSize) {
        ref.read(hasNext.notifier).state = false;
      } else {
        _currentPage++;
      }
      ref.read(products.notifier).addProducts(newProducts);
    }
  }

  void setSelectedProduct(WidgetRef ref, ProductModel product) {
    ref.read(selectedProduct.notifier).state = product;
  }
}

class ProductsStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductsStateNotifier() : super([]);

  void addProducts(List<ProductModel> newProducts) {
    state = [...state, ...newProducts];
  }
}
