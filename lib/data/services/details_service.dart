import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/data/models/details_model.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:dio/dio.dart';

class DetailsService {
  final _dio = Dio();

  Future<DetailsModel?> getDetails(int id) async {
    try {
      final response = await _dio.get(ApiEndpoints.getDetails(id));
      if (response.data['message'] == 'Success') {
        final details = DetailsModel.fromJson(response.data['data']['product']);
        Logger.log('getting Details Successfully: $id', 1);
        return details;
      }
      else {
        Logger.log('error getting details ${response.data['message']}', -1);
      }
    } catch (e) {
      Logger.log('error getting details $e', -1);
    }
    return null;
  }
}