import 'package:get/get.dart';

import '../controllers/filtered_category_controller.dart';

class FilteredCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilteredCategoryController>(
      () => FilteredCategoryController(),
    );
  }
}
