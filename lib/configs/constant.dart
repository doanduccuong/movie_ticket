import 'package:movie_ticket/configs/images.dart';
import 'package:movie_ticket/model/film_detail_model.dart';
import 'package:movie_ticket/model/fiml_review.dart';
import 'package:movie_ticket/ui/choose_cnime_seats/seatRow.dart';
class Constants {
  static const List<String> texts = [
    'Action',
    'Comedy',
    'Romance',
    'Thrill',
    'Fantasy',
  ];
  static const List<String> images = [
    AppImages.imgSpiderman,
    AppImages.imgEnternal,
    AppImages.imgMaxtrix,
  ];
  static const List<String> categoryTitle = [
    '13+',
    'Action',
    'IMAX',
    '2 Trailers',
  ];
  static const String filmDescription =
      "With Spider-Man's identity now revealed, our friendly neighborhood web-slinger is unmasked and no longer able to separate his normal life as Peter Parker from the high stakes of being a superhero. When Peter asks for help from Doctor Strange, the stakes become even more dangerous, forcing him to discover what it... More";
  static List<SeatRow> seatGenerate = [
    SeatRow(numSeat: 6, avaiableSeat: [2, 3, 5],),
    for(int i = 0; i < 6; i++)
      SeatRow(numSeat: 8, avaiableSeat: [3],),
    SeatRow(numSeat: 6, avaiableSeat: [1, 2, 3, 5],),
  ];
  static const apiKey = "cce5a481f8d29ff58e07afcd44e7681f";
  static List<FilmDetailModel> filmDetail = [
    FilmDetailModel(title: 'Spiderman: No Way Home', ageRestrict: '13+'),
    FilmDetailModel(title: 'The Eternal',ageRestrict: '16+'),
    FilmDetailModel(title: 'The Matrix Resurrections',ageRestrict: '12+'),
  ];
  static List<FilmReview> filmDescribe=[
    FilmReview(image: AppImages.imgDetailSpiderman, description: 'filmDescription'),
    FilmReview(image: AppImages.imgDetailMaxtrix, description: 'filmDescription'),
    FilmReview(image: AppImages.imgDetailMaxtrix, description: 'filmDescription'),
  ];
}
