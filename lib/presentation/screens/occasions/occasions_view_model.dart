import 'package:demo_project/data/models/occasion_model.dart';
import 'package:demo_project/data/repositories/occasions_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OccasionsViewModel {
  //constants
  final _repo = OccasionsRepo();
  final _pageSize = 10;

  //variables
  var _currentPage = 1;

  //providers
  final hasNext = StateProvider<bool>((ref) => true);
  static final selectedOccasion = StateProvider<OccasionModel?>((ref) => null);
  final occasions =
      StateNotifierProvider<OccasionsStateNotifier, List<OccasionModel>>(
          (ref) => OccasionsStateNotifier());

  //functions
  Future<void> loadMoreData(WidgetRef ref) async {
    if (ref.read(hasNext)) {
      List<OccasionModel>? newOccasions =
          await _repo.getOccasions(_currentPage);
      if (newOccasions == null) return;
      if (newOccasions.length < _pageSize) {
        ref.read(hasNext.notifier).state = false;
      } else {
        _currentPage++;
      }
      ref.read(occasions.notifier).addOccasions(newOccasions);
    }
  }

  void setOccasion(WidgetRef ref, OccasionModel occasion) {
    ref.read(selectedOccasion.notifier).state = occasion;
  }
}

class OccasionsStateNotifier extends StateNotifier<List<OccasionModel>> {
  OccasionsStateNotifier() : super([]);

  void addOccasions(List<OccasionModel> newOccasions) {
    state = [...state, ...newOccasions];
  }
}
