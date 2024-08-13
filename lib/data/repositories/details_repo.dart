import 'package:demo_project/data/models/details_model.dart';
import 'package:demo_project/data/services/details_service.dart';

class DetailsRepo {
  final _service = DetailsService();

  Future<DetailsModel?> getDetails(int id) async {
    return await _service.getDetails(id);
  }
}