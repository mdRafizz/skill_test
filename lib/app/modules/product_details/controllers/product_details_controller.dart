import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_test/app/data/models/product.dart';

class ProductDetailsController extends GetxController {

  late Product product;
  final CarouselController controller = CarouselController(initialItem: 0);

  @override
  void onInit() {
    product = Get.arguments;
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

}
