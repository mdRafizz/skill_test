import 'package:get/get.dart';

import '../modules/filtered_category/bindings/filtered_category_binding.dart';
import '../modules/filtered_category/views/filtered_category_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/search_result/bindings/search_result_binding.dart';
import '../modules/search_result/views/search_result_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => const SearchResultView(),
      binding: SearchResultBinding(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 765),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 765),
    ),
    GetPage(
      name: _Paths.FILTERED_CATEGORY,
      page: () => const FilteredCategoryView(),
      binding: FilteredCategoryBinding(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 765),
    ),
  ];
}
