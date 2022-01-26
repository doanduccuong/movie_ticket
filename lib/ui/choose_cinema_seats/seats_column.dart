import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/constant.dart';
import 'package:movie_ticket/ui/choose_cinema_seats/seat_row.dart';


Widget seatColumn() {
  return Column(
    children: List.generate(
      Constants.seatGenerate.length,
      (index) => SeatRow(numSeat: Constants.seatGenerate[index].numSeat, availableSeat: Constants.seatGenerate[index].availableSeat,),
    ),
  );
}
