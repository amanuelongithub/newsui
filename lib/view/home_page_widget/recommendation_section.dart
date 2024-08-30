import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobtest/model/publisher_model.dart';
import 'package:jobtest/view/widgets/constant.dart';

class RecommendationSection extends StatelessWidget {
  final PublisherModelDatum publisherModelDatum;

  const RecommendationSection({super.key, required this.publisherModelDatum});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(82, 229, 243, 255),
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset(publisherModelDatum.img!),
                ),
                SizedBox(width: 6.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          publisherModelDatum.name!,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4.w),
                        // ignore: prefer_const_constructors
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 15,
                        ),
                      ],
                    ),
                    Text(
                      getDate(publisherModelDatum.data!.first.publishedDate!)!,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ]),
              Row(children: [
                if (!publisherModelDatum.isUserfolow!)
                  TextButton(
                    style: TextButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(80, 35),
                        backgroundColor:
                            const Color.fromARGB(82, 190, 226, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: Text(
                      "Follow",
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                    ),
                  ),
                const Icon(Icons.more_vert_outlined)
              ]),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            publisherModelDatum.data!.first.title!,
            maxLines: 3,
            style: TextStyle(
                color: Colors.black,
                fontSize: 21.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 2.sp),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              publisherModelDatum.data!.first.category!,
              style: TextStyle(fontSize: 15.sp, color: Colors.blue),
            ),
          ),
          SizedBox(height: 10.h),
          if (publisherModelDatum.img != null) ...{
            SizedBox(
                width: double.infinity,
                height: 200.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    publisherModelDatum.data!.first.image!,
                    fit: BoxFit.cover,
                  ),
                )),
          },
        ],
      ),
    );
  }
}
