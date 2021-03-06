import 'package:flutter/material.dart';
import 'package:movie_ticket/configs/colors.dart';
import 'package:movie_ticket/configs/images.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';

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
        flags: const YoutubePlayerFlags(
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
          showVideoProgressIndicator: true,
          controller: _controller,
        ),
        builder: (context, player) {
          return Container(
            margin: EdgeInsets.only(
              left: 30.w,
            ),
            padding: isPlay == false
                ? EdgeInsets.only(left: 15.w, right: 16.w, top: 13.h)
                : null,
            child: isPlay == false
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextNormal(
                            title: 'The Batman',
                            size: 15.sp,
                            height: 1.5.h,
                          ),
                          InkWell(
                            onTap: () {
                              share();
                            },
                            child: Icon(
                              Icons.share,
                              size: 20.sp,
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 51.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 58.h),
                        height: 34.h,
                        width: 34.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.selectedBoxColor,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isPlay = true;
                            });
                          },
                          child: const Icon(
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
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: SizedBox(
                      width: 320.w,
                      height: 220.h,
                      child: player,
                    ),
                  ),
            width: 320.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: const DecorationImage(
                  image: AssetImage(AppImages.imgBatman), fit: BoxFit.cover),
            ),
          );
        });
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Copy Link',
        linkUrl: 'https://www.youtube.com/watch?v=u34gHaRiBIU&t=89s');
  }
}
