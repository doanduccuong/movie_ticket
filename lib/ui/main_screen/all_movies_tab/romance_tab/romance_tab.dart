import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/configs/constant.dart';
import 'package:movie_ticket/cubit/app_cubit.dart';
import 'package:movie_ticket/cubit/app_cubit_states.dart';
import 'package:movie_ticket/model/data_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_ticket/ui/component/reuse_box/reuse_box.dart';
import 'package:movie_ticket/ui/component/text/text_normal.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
class RomanceTab extends StatefulWidget {
  const RomanceTab({Key? key}) : super(key: key);

  @override
  State<RomanceTab> createState() => _RomanceTabState();
}

class _RomanceTabState extends State<RomanceTab> {
  int _focusIndex = 0;
  int chooseIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var httpData = state.httpData;
          List<DataModel> thrillList = [];
          for (int i = 0; i < httpData.length; i++) {
            httpData[i].genreIds!.contains(53)
                ? thrillList.add(httpData[i])
                : null;
          }
          print(thrillList[3].title);
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 18.48.h),
                height: 242.52.h,
                width: double.infinity,
                child: ScrollSnapList(
                  shrinkWrap: true,
                  dynamicItemSize: true,
                  reverse: true,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: _focusIndex == index
                        ? () {
                      setState(() {
                        chooseIndex = index;
                      });
                      BlocProvider.of<AppCubit>(context)
                          .getDetailData(thrillList[index]);
                    }
                        : null,
                    child: Container(
                      height: 201.64.h,
                      width: 177.6.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500" +
                                    thrillList[index].backdropPath!),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  itemCount: 3,
                  onItemFocus: (int index) {
                    _onItemFocus(index);
                  },
                  itemSize: 177.6.w,
                ),
              ),
              Center(
                child: TextNormal(
                  title: thrillList[_focusIndex].originalTitle!,
                  fontWeight: FontWeight.w500,
                  height: 1.5.h,
                  size: 16.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReUseBox(
                    title: Constants.filmDetail[_focusIndex].ageRestrict,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ReUseBox(title: 'Action'),
                  SizedBox(
                    width: 10.w,
                  ),
                  ReUseBox(
                    title: 'IMAX',
                  )
                ],
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
  void _onItemFocus(int index) {
    setState(
          () {
        _focusIndex = index;
      },
    );
  }
}
