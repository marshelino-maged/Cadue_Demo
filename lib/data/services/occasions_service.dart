import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/data/models/occasion_model.dart';
import 'package:demo_project/data/services/api_helper.dart';
import 'package:demo_project/utils/logger.dart';

class OccasionsService {

  Future<List<OccasionModel>?> getOccasions(int page) async {
    try {
      final data = await ApiHelper.makeGetRequest(ApiEndpoints.getOccasions(page));
      if(data != null) {
        if(data['message'] == "Success"){
          final occasions = (data['data']['occasion_types'] as List)
              .map((occasion) => OccasionModel.fromJson(occasion))
              .toList();
          Logger.log('getting occasions Successfully: $page', 1);
          return occasions;
        } else {
          Logger.log('error getting occasions ${data['message']}', -1);
        }
      }
    } catch (e) {
      Logger.log('error getting occasions $e', -1);
    }    
    return null;
  }
}