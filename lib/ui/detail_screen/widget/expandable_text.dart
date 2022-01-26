import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText({Key? key, required this.overViewTex}) : super(key: key);
  String overViewTex;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConstrainedBox(
              constraints: isExpand == true
                  ? const BoxConstraints()
                  : BoxConstraints(maxHeight: 50.h),
              child: Text(
                widget.overViewTex,
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 11.sp,
                    height: 1.5.h,
                    fontWeight: FontWeight.w300),
              ),
            ),
            isExpand == false
                ? InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                setState(() {
                  isExpand=!isExpand;
                });
              },
                    child: TextNormal(
                      title: 'Show More',
                      colors: AppColors.selectedBoxColor,
                      size: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                : InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                setState(() {
                  isExpand=!isExpand;
                });
              },
              child: TextNormal(
                title: 'Show Less',
                colors: AppColors.selectedBoxColor,
                size: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
