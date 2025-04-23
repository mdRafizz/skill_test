import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/product_tile.dart';
import '../controllers/filtered_category_controller.dart';

class FilteredCategoryView extends GetView<FilteredCategoryController> {
  const FilteredCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Obx(() {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                transitionBuilder:
                    (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                child:
                    controller.isLoading.value
                        ? _buildShimmerGridBox(key: ValueKey('shimmer'))
                        : controller.products.isEmpty
                        ? SizedBox(
                      height: Get.height*.4,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'No product is found in this category',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        )
                        : _buildProductGridBox(key: ValueKey('products')),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      pinned: false,
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Text(
        Get.arguments.name,
        style: GoogleFonts.inter(fontSize: 22.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildShimmerGridBox({Key? key}) {
    return Padding(
      key: key,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 0.6,
        ),
        itemBuilder:
            (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                width: 156.w,
                height: 263.h,
              ),
            ),
      ),
    );
  }

  Widget _buildProductGridBox({Key? key}) {
    return Padding(
      key: key,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // important
        itemCount: controller.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          final product = controller.products[index];
          return ProductTile(product);
        },
      ),
    );
  }
}
