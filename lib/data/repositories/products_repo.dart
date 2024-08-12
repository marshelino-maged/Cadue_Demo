import 'package:demo_project/data/models/product_model.dart';
import 'package:demo_project/data/services/products_service.dart';

class ProductsRepo {
  final _service = ProductsService();

  Future<List<ProductModel>?> getProducts(int page, int typeId) async {
    return await _service.getProducts(page, typeId);
  }
    
}