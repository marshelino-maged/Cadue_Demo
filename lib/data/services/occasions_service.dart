import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/data/models/occasion_model.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:dio/dio.dart';

class OccasionsService {

  final _dio = Dio();
  Future<List<OccasionModel>?> getOccasions(int page) async {
    try {
      final response = await _dio.get(ApiEndpoints.getOccasions(page));
      if(response.data['message'] == "Success"){
        final occasions = (response.data['data']['occasion_types'] as List)
            .map((occasion) => OccasionModel.fromJson(occasion))
            .toList();
        Logger.log('getting occasions Successfully: $page', 1);
        return occasions;
      } else {
        Logger.log('error getting occasions ${response.data['message']}', -1);
      }
    } catch (e) {
      Logger.log('error getting occasions $e', -1);
    }    
    return null;
  }
}