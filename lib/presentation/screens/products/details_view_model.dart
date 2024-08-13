import 'package:demo_project/data/models/details_model.dart';
import 'package:demo_project/data/repositories/details_repo.dart';
import 'package:demo_project/presentation/screens/products/products_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsViewModel {
  DetailsViewModel();

  //constants
  final _repo = DetailsRepo();
  
  //providers
  final isLoading = StateProvider<bool>((ref) => true);
  final details = StateProvider<DetailsModel>((ref) => DetailsModel());

  //functions
  Future<void> loadData(WidgetRef ref) async {
    final id = ref.read(ProductsViewModel.selectedProduct)!.id!;
    final data = await _repo.getDetails(id);
    if (data != null) {
      ref.read(details.notifier).state = data;
      ref.read(isLoading.notifier).state = false;
    }
    else {
      loadData(ref);
    }
  }
}