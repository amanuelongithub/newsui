import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobtest/model/newscard_model.dart';
import 'package:jobtest/view/widgets/constant.dart';

class TrendingSection extends StatelessWidget {
  final String? img;
  final String title;
  final String cate;
  final DateTime date;
  final Publisher publisher;
  const TrendingSection(
      {super.key,
      this.img,
      required this.title,
      required this.date,
      required this.publisher,
      required this.cate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: const BoxDecoration(),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (img != null) ...{
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    child: Image.asset(
                      img!,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: 10.sp,
                    left: 7.sp,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.sp, vertical: 2.sp),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        cate,
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                    ))
              ],
            ),
          },
          SizedBox(height: 10.h),
          SizedBox(
            width: 300.w,
            child: Text(
              title,
              maxLines: 3,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 25.w,
                      height: 25.h,
                      child: Image.asset(
                        publisher.img!,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(width: 5.h),
                  Text(
                    publisher.name!,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 3.h),
                  Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 15.r,
                  ),
                ],
              ),
              Text(
                getDate(date)!,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
