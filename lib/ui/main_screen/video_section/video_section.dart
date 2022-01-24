import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/images.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({Key? key}) : super(key: key);

  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  bool isPlay = false;
  late YoutubePlayerController _controller;
  String url = 'https://www.youtube.com/watch?v=u34gHaRiBIU&t=88s';
  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        flags: YoutubePlayerFlags(
          autoPlay: true,
          isLive: false,
        ),
        initialVideoId: YoutubePlayer.convertUrlToId(url)!);
  }

  @override
  void initState() {
    // TODO: implement initState
    runYoutubePlayer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {

    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          aspectRatio: 330/220,
          showVideoProgressIndicator: true,
          controller: _controller,
        ),
        builder: (context, player) {
          return Container(
            margin: EdgeInsets.only(
              left: 30.w,
            ),
            padding: isPlay==false?EdgeInsets.only(left: 15.w, right: 16.w, top: 13.h):null,
            child: isPlay==false?Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextNormal(
                      title: 'The Batman',
                      size: 15.sp,
                      height: 1.5.h,
                    ),
                    Icon(
                      Icons.share,
                      size: 20.sp,
                      color: AppColors.textColor,
                    )
                  ],
                ),
                SizedBox(
                  height: 51.h,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 58.h),
                  height: 34.h,
                  width: 34.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.selectedboxColor,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isPlay = true;
                      });
                    },
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(AppImages.imgTicket),
                    TextNormal(
                      title: 'Ticket Available',
                      size: 9.sp,
                      height: 1.5.h,
                    )
                  ],
                ),
              ],
            ):ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: 320.w,
                height: 220.h,
                child: player,
              ),
            ),
            width: 320.w,
            height: 220.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: AssetImage(AppImages.imgBatman), fit: BoxFit.cover),
            ),
          );
        });
  }
}
