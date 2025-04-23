import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSnack {
  static successSnack(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }

    Get.rawSnackbar(
      duration: const Duration(seconds: 6),
      borderRadius: 7.r,
      backgroundColor: const Color(0xFF1d9279),
      margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 20.h),
      messageText: Row(
        spacing: 12.w,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.checkmark_alt_circle_fill,
            color: CupertinoColors.white,
            size: 19.sp,
          ),
          Expanded(child: Text(message, style: GoogleFonts.inter(color: CupertinoColors.white,fontSize: 14.sp),)),
        ],
      ),
    );
  }

  static errorSnack(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }

    Get.rawSnackbar(
      duration: const Duration(seconds: 6),
      borderRadius: 7.r,
      backgroundColor: const Color(0xFFe6274e),
      margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 20.h),
      messageText: Row(
        spacing: 12.w,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.multiply_circle_fill,
            color: CupertinoColors.white,
            size: 19.sp,
          ),
          Expanded(child: Text(message, style: GoogleFonts.inter(color: CupertinoColors.white,fontSize: 14.sp),)),
        ],
      ),
    );
  }
}
