import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/ui/choose_cnime_seats/widget/reservedTicket.dart';

class SeatRow extends StatelessWidget {
  SeatRow({Key? key, required this.numSeat, required this.avaiableSeat})
      : super(key: key);
  int numSeat;
  List<int> avaiableSeat;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        numSeat,
        (index) => Row(
          children: [
            avaiableSeat.contains(index + 1)
                ? InkWell(
                    onTap: () {},
                    child: ReservedTicket()
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 5.5.w, vertical: 5.5.h),
                    width: 27.h,
                    height: 27.h,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
            index == (numSeat / 2) - 1
                ? SizedBox(
                    width: 54.w,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
