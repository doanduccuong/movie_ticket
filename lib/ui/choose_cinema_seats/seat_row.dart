import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/widget/available_ticket.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/widget/reserved_ticket.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/widget/selected_ticket.dart';

class SeatRow extends StatefulWidget {
  SeatRow({Key? key, required this.numSeat, required this.availableSeat})
      : super(key: key);
  int numSeat;
  List<int> availableSeat;

  @override
  State<SeatRow> createState() => _SeatRowState();
}

class _SeatRowState extends State<SeatRow> {
  List<bool> selectedSeat = [];
  @override
  void initState() {
    for (int i = 0; i < widget.numSeat; i++) {
      if (i != widget.availableSeat) {
        selectedSeat.add(false);
      } else {
        selectedSeat.add(true);
      }
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.numSeat,
        (index) => Row(
          children: [
            widget.availableSeat.contains(index + 1)
                ? ReservedTicket()
                : InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedSeat[index] = !selectedSeat[index];
                      });
                    },
                    child: selectedSeat[index] == true
                        ? SelectedTicket()
                        : AvailableTicket(),
                  ),
            index == (widget.numSeat / 2) - 1
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
