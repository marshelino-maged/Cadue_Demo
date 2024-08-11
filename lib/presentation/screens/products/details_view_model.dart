import 'package:demo_project/data/models/details_model.dart';
import 'package:demo_project/data/repositories/details_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsViewModel {
  DetailsViewModel(this.id);

  //constants
  final _repo = DetailsRepo();
  final int id;
  
  //providers
  final isLoading = StateProvider<bool>((ref) => true);
  final details = StateProvider<DetailsModel>((ref) => DetailsModel());

  //functions
  Future<void> init(WidgetRef ref) async {
    final data = await _repo.getDetails(id);
    if (data != null) {
      ref.read(details.notifier).state = data;
      ref.read(isLoading.notifier).state = false;
    }
    else {
      init(ref);
    }
  }
}