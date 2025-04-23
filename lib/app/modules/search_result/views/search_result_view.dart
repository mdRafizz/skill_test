import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/app_snack.dart';
import '../../../widgets/product_tile.dart';
import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({super.key});
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
                      'No product is found',
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
        "Search Result",
        style: GoogleFonts.inter(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(65.h),
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.h,left: 16.w,right: 16.h),
          child: _buildSearchBar(),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: const Color(0xffD1D5DB),
          width: .5.w,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
              child: TextField(
                controller: TextEditingController(text: Get.arguments),
                onChanged: (val) => controller.query(val),
                onSubmitted: (val){
                  print('Current query: ${controller.query.value.length}');
                  if(controller.query.value.isNotEmpty){
                    controller.updateSearch(controller.query.value);
                  }else{
                    AppSnack.errorSnack('Enter search keywords first');
                  }
                } ,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 11.w,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Anything...',
                  hintStyle: GoogleFonts.inter(
                    color: const Color(0xff9CA3AF),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('Current query: ${controller.query.value.length}');
              if(controller.query.value.isNotEmpty){
                controller.updateSearch(controller.query.value);
              }else{
                AppSnack.errorSnack('Enter search keywords first');
              }
            },
            child: Container(
              width: 43.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                color: Colors.amber,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.sp),
                child: SvgPicture.asset(
                  'assets/images/icons_svg/search.svg',
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),
          ),
        ],
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
