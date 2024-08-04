import 'package:demo_project/data/models/occasion_model.dart';
import 'package:demo_project/data/services/occasions_service.dart';

class OccasionsRepo {
  final OccasionsService _service = OccasionsService();

  Future<List<OccasionModel>?> getOccasions(int page) async {
    return await _service.getOccasions(page);
  }
}
