import 'package:flutter/cupertino.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextNormal extends StatelessWidget {
  final String title;
  final Color? colors;
  final double? size;
  final double? height;
  final bool? isCenter;
  final FontWeight? fontWeight;

  const TextNormal(
      {Key? key,
        required this.title,
        this.colors,
        this.size,
        this.height,
        this.isCenter,
        this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: isCenter != null ? TextAlign.center : null,
      style: TextStyle(
        color: colors ?? AppColors.textColor,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: 'Poppins',
        fontSize: size ?? 17.sp,
        height: height ?? 1.5.h,
      ),
    );
  }
}