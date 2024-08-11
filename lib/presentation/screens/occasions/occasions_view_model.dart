import 'package:demo_project/data/models/occasion_model.dart';
import 'package:demo_project/data/repositories/occasions_repo.dart';
import 'package:demo_project/presentation/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OccasionsViewModel {
  //constants
  final _listController = ScrollController();
  final _repo = OccasionsRepo();
  get controller => _listController;

  //variables
  var _currentPage = 1;

  //providers
  final hasNext = StateProvider<bool>((ref) => true);
  final occasions =
      StateNotifierProvider<OccasionsStateNotifier, List<OccasionModel>>(
          (ref) => OccasionsStateNotifier());

  //functions
  void init(WidgetRef ref) {
    _listController.addListener(() {
      if (_listController.position.pixels ==
          _listController.position.maxScrollExtent) {
        _loadMoreData(ref);
      }
    });
    _loadMoreData(ref);
  }

  Future<void> _loadMoreData(WidgetRef ref) async {
    if (ref.read(hasNext)) {
      List<OccasionModel>? newOccasions =
          await _repo.getOccasions(_currentPage);
      if (newOccasions == null) return;
      if (newOccasions.isEmpty) ref.read(hasNext.notifier).state = false;
      if (newOccasions.isNotEmpty) _currentPage++;
      ref.read(occasions.notifier).addOccasions(newOccasions);
    }
  }

  void showProducts(BuildContext context,
      {required String occasionTitle, required int occasionId}) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: ProductsScreen(title: occasionTitle, occasionId: occasionId),
      withNavBar: true,
    );
  }
}

class OccasionsStateNotifier extends StateNotifier<List<OccasionModel>> {
  OccasionsStateNotifier() : super([]);

  void addOccasions(List<OccasionModel> newOccasions) {
    state = [...state, ...newOccasions];
  }
}
