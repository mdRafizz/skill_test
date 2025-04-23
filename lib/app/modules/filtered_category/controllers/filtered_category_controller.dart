import 'package:get/get.dart';
import 'package:skill_test/app/data/models/product_category.dart';

import '../../../data/models/product.dart';
import '../../../data/providers/api_services.dart';

class FilteredCategoryController extends GetxController {


  var isLoading = false.obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchAllProducts(Get.arguments);
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

  Future<void> fetchAllProducts(ProductCategory category) async {
    isLoading.value = true;
    try {
      final response = await ApiService.dio.get('products/category/${category.name}');

      var dataList = response.data['products'] as List;
      products.value = dataList.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      print('Error fetching all products: $e');
    } finally {
      isLoading.value = false;
    }
  }

}
