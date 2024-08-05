import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/data/models/product_model.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:dio/dio.dart';

class ProductsService {
  final _dio = Dio();

  Future<List<ProductModel>?> getProducts(int page, typeId) async {
    try {
      final response = await _dio.get(ApiEndpoints.getProducts(page, typeId));
      if (response.data['message'] == 'Success') {
        final products = (response.data['data']['products'] as List).map((e) => ProductModel.fromJson(e)).toList();
        Logger.log('getting products Successfully: $page', 1);
        return products;
      }
      else {
        Logger.log('error getting products ${response.data['message']}', -1);
      }
    } catch (e) {
      Logger.log('error getting products $e', -1);
    }
    return null;
  }
}
