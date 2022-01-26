import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/widget/available_ticket.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/widget/reserved_ticket.dart';

class SeatRow extends StatelessWidget {
  SeatRow({Key? key, required this.numSeat, required this.availableSeat})
      : super(key: key);
  int numSeat;
  List<int> availableSeat;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        numSeat,
        (index) => Row(
          children: [
            availableSeat.contains(index + 1)
                ? ReservedTicket()
                : InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){},
                  child: AvailableTicket()
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
