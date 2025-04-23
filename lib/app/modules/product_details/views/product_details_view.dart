import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Gap(51.h),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black45
                ),
                padding: EdgeInsets.all(4.h),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 15.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Gap(16.h),
          CarouselSlider.builder(
            itemCount: controller.product.images!.length,
            itemBuilder: (context, index, realIdx) {
              final imageUrl = controller.product.images![index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey.shade200,
                    child: const Center(child: CupertinoActivityIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            },
            options: CarouselOptions(
              height: 250.h,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.85,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          ),
          Gap(16.h),
          Text(
            controller.product.title!,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 19.sp,
            ),
          ),
          Gap(16.h),
          Text(
            controller.product.description!,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.normal,
              fontSize: 15.sp,
            ),
          ),
          Gap(16.h),
          Text(
            "\$${controller.product.price}",
            style: GoogleFonts.inter(fontSize: 12.sp),
          ),
          Gap(16.h),
          Row(
            children: [
              RatingBar.builder(
                initialRating: controller.product.rating!,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.only(right: 2.w),
                itemSize: 12.sp,
                itemBuilder:
                    (context, _) => Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 12.sp,
                    ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text(
                "(${controller.product.reviews!.length})",
                style: GoogleFonts.inter(fontSize: 12.sp),
              ),
            ],
          ),
          Gap(16.h),
        ],
      ),
    );
  }
}
