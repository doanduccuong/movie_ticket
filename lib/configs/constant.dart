import 'package:movie_ticket/configs/images.dart';
import 'package:movie_ticket/model/film_detail_model.dart';
import 'package:movie_ticket/model/fiml_review.dart';
import 'package:movie_ticket/ui/choose_cnime_seats/seat_row.dart';

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
    SeatRow(
      numSeat: 6,
      avaiableSeat: [2, 3, 5],
    ),
    for (int i = 0; i < 6; i++)
      SeatRow(
        numSeat: 8,
        avaiableSeat: [3],
      ),
    SeatRow(
      numSeat: 6,
      avaiableSeat: [1, 2, 3, 5],
    ),
  ];
  static const apiKey = "cce5a481f8d29ff58e07afcd44e7681f";
  static List<FilmDetailModel> filmDetail = [
    FilmDetailModel(title: 'Spiderman: No Way Home', ageRestrict: '13+'),
    FilmDetailModel(title: 'The Eternal', ageRestrict: '16+'),
    FilmDetailModel(title: 'The Matrix Resurrections', ageRestrict: '12+'),
  ];
  static List<FilmReview> filmDescribe = [
    FilmReview(
      image: AppImages.imgDetailSpiderman,
      description:
          "With Spider-Man's identity now revealed, our friendly neighborhood web-slinger is unmasked and no longer able to separate his normal life as Peter Parker from the high stakes of being a superhero. When Peter asks for help from Doctor Strange, the stakes become even more dangerous, forcing him to discover what it... More",
      title: "Spider-Man: No Way Home",
    ),
    FilmReview(
      image: AppImages.imgDetailEternal,
      description:
          'This film is getting a five for now because I do not know better how to rate it. As a whole, it seems like it is missing something and should be lower (a 3 or 4). For what should be a horror film, it comes off more as a romantic drama... which is not what I want.',
      title: 'The Eternal',
    ),
    FilmReview(
      image: AppImages.imgDetailMaxtrix,
      description:
          'First it was the epic reunion (wink wink) in the latest Spiderman instalment and now there’s the resurrection of the Matrix. Get the leather jackets, vinyl pants, motorcycle boots, bikes and futuristic sunglasses back for the Matrix universe is here. Need we say more?',
      title: 'The Matrix: Restruction',
    ),
  ];
}
