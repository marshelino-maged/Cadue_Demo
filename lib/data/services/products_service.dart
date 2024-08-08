import 'package:demo_project/data/api_endpoints.dart';
import 'package:demo_project/data/models/product_model.dart';
import 'package:demo_project/data/services/api_helper.dart';
import 'package:demo_project/utils/logger.dart';

class ProductsService {

  Future<List<ProductModel>?> getProducts(int page, typeId) async {
    try {
      final data = await ApiHelper.makeGetRequest(ApiEndpoints.getProducts(page, typeId));
      if (data != null) {
        if (data['message'] == 'Success') {
          final products = (data['data']['products'] as List).map((e) => ProductModel.fromJson(e)).toList();
          Logger.log('getting products Successfully: $page', 1);
          return products;
        }
        else {
          Logger.log('error getting products ${data['message']}', -1);
        }
      }
    } catch (e) {
      Logger.log('error getting products $e', -1);
    }
    return null;
  }
}
