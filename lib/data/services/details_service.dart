import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/data/models/details_model.dart';
import 'package:demo_project/data/api_helper.dart';
import 'package:demo_project/utils/logger.dart';

class DetailsService {

  Future<DetailsModel?> getDetails(int id) async {
    try {
      final data = await ApiHelper.makeGetRequest(ApiEndpoints.getDetails(id));
      if(data != null) {
        if (data['message'] == 'Success') {
          final details = DetailsModel.fromJson(data['data']['product']);
          Logger.log('getting Details Successfully: $id', 1);
          return details;
        }
        else {
          Logger.log('error getting details ${data['message']}', -1);
        }
      }
    } catch (e) {
      Logger.log('error getting details $e', -1);
    }
    return null;
  }
}