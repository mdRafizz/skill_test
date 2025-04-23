import 'package:get/get.dart';

import '../../../data/models/product.dart';
import '../../../data/providers/api_services.dart';

class SearchResultController extends GetxController {
  var isLoading = false.obs;
  var products = <Product>[].obs;
  var query = ''.obs;

  @override
  void onInit() {
    searchProducts(Get.arguments);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> searchProducts(String query) async {
    isLoading.value = true;
    try {
      final response = await ApiService.dio.get(
        'products/search',
        queryParameters: {'q': query},
      );

      var dataList = response.data['products'] as List;
      products.value = dataList.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      print('Error searching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void updateSearch(String q){
    searchProducts(q);
    update();
  }
}
