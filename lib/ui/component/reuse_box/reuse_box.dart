import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/ui/component/text/text_bold.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReUseBox extends StatelessWidget {
  ReUseBox(
      {Key? key,
      this.isImage = false,
      required this.title,
      this.backgroundColor,
      this.containerHeigh,
      this.textSize,
      this.isFlexible = true,
      this.containerWidth,
      this.borderRadius=10,
        this.textHeigh,
      this.image})
      : super(key: key);
  String title;
  Color? backgroundColor;
  double? containerHeigh;
  double? containerWidth;
  double? textSize;
  bool? isFlexible;
  String? image;
  bool isImage;
  double borderRadius;
  double? textHeigh;
  @override
  Widget build(BuildContext context) {
    return isFlexible == true
        ? Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              height: containerHeigh ?? 22.h,
              child: TextNormal(
                title: title,
                size: textSize ?? 13.sp,
                height: textHeigh??1.5.h,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.iPrimaryColor),
            ),
          )
        : Container(
            alignment: Alignment.center,
            height: containerHeigh ?? 57.h,
            width: containerWidth ?? 169.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isImage == true
                    ? Image(image: AssetImage(image!))
                    : Container(),
                SizedBox(
                  width: 8.w,
                ),
                TextBold(title: title, size: textSize??15.sp, height: textHeigh??1.5.h,),
              ],
            ),
            decoration: BoxDecoration(
                color: AppColors.selectedboxColor,
                borderRadius: BorderRadius.circular(borderRadius),
            )
          );
  }
}
