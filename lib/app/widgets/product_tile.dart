import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_test/app/data/models/product.dart';
import 'package:skill_test/app/routes/app_pages.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        child: SizedBox(
          width: 156.w,
          height: 263.h,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  CachedNetworkImage(
                    imageUrl: product.thumbnail.toString(),
                    placeholder:
                        (_, __) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 156.w,
                            height: 164.h,
                            color: Colors.white,
                          ),
                        ),
                    width: 156.w,
                    height: 164.h,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    product.title.toString(),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: GoogleFonts.inter(fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: product.rating!,
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
                        "(${product.reviews!.length})",
                        style: GoogleFonts.inter(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.black45,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Text(
                    product.category.toString(),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
