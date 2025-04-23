import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:skill_test/app/data/models/product.dart';
import 'package:skill_test/app/data/models/product_category.dart';
import 'package:skill_test/app/routes/app_pages.dart';

import '../../../data/providers/api_services.dart';

class HomeController extends GetxController {

  var isLoading = false.obs;
  var products = <Product>[].obs;
  var query = ''.obs;
  var categories = <ProductCategory>[].obs;
  var selectedCategory = Rxn<ProductCategory>();

  @override
  void onInit() {
    fetchAllProducts();
    fetchCategories();
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

  Future<void> fetchAllProducts({int limit = 100}) async {
    isLoading.value = true;
    try {
      final response = await ApiService.dio.get('products', queryParameters: {
        'limit': limit,
      });

      var dataList = response.data['products'] as List;
      products.value = dataList.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      print('Error fetching all products: $e');
    } finally {
      isLoading.value = false;
    }
  }
  void fetchCategories() async {
    try {
      isLoading(true);
      final response = await ApiService.dio.get('products/categories');
      categories.value =
      List<ProductCategory>.from(response.data.map((e) => ProductCategory.fromJson(e)));
    } catch (e) {
      Get.snackbar('Error', 'Failed to load categories');
    } finally {
      isLoading(false);
    }
  }

  void selectCategory(ProductCategory category) {
    Get.toNamed(Routes.FILTERED_CATEGORY,arguments: category);
  }

}
