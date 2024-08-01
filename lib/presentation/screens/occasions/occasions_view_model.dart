import 'package:demo_project/presentation/screens/occasions/occasion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OccasionsViewModel {

  //constants
  final _listController = ScrollController();
  get controller => _listController;

  //providers
  final hasNext = StateProvider<bool>((ref) => true);
  final occasions =
      StateNotifierProvider<OccasionsStateNotifier, List<OccasionItem>>(
          (ref) => OccasionsStateNotifier());

  //functions
  void init(WidgetRef ref) {
    _listController.addListener(() {
      if (_listController.position.pixels == _listController.position.maxScrollExtent) {
        _loadMoreData(ref);
      }
    });
    // to be done
    // fetch the data of page 1
  }

  // dummy function to simulate loading more data
  void _loadMoreData(WidgetRef ref) {
    Future.delayed(const Duration(seconds: 2), () {
      if (ref.read(hasNext.notifier).state) {
        ref.read(hasNext.notifier).state = false;
        ref.read(occasions.notifier).addOccasions([
          OccasionItem(),
          OccasionItem(),
        ]);
      }
    });
  }
}

class OccasionsStateNotifier extends StateNotifier<List<OccasionItem>> {
  OccasionsStateNotifier()
      : super([OccasionItem(), OccasionItem(), OccasionItem(), OccasionItem()]);

  void addOccasions(List<OccasionItem> newOccasions) {
    state = [...state, ...newOccasions];
  }
}
