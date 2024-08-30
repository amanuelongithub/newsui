import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jobtest/controller/home_controller.dart';
import 'package:jobtest/view/home_page_widget/recommendation_section.dart';
import 'package:jobtest/view/home_page_widget/trending_section.dart';
import 'package:jobtest/view/widgets/my_button.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(80.w, 300.h),
          child: Padding(
            padding: EdgeInsets.only(top: 50.h, left: 20, right: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(icon: Icons.menu),
                MyButton(icon: Icons.notifications_outlined),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: GetBuilder<HomeController>(builder: (homecontroller) {
            if (homecontroller.isLoading == true) {
              return const CircularProgressIndicator();
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            "Welcome back, Tyler!",
                            style: TextStyle(
                                fontSize: 28.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.h),
                          Text("Discover a world of news that matters to you",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17.sp,
                              )),
                          SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending news",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "see all",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            homecontroller.newsCardModel!.data!.data!.length,
                            (index) => TrendingSection(
                                  img: homecontroller
                                      .newsCardModel!.data!.data![index].image,
                                  title: homecontroller
                                      .newsCardModel!.data!.data![index].title!,
                                  cate: homecontroller.newsCardModel!.data!
                                      .data![index].category!,
                                  date: homecontroller.newsCardModel!.data!
                                      .data![index].publishedDate!,
                                  publisher: homecontroller.newsCardModel!.data!
                                      .data![index].publisher!,
                                )),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "Recommendation",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                            homecontroller.publisherModel!.data!.length,
                            (index) => RecommendationSection(
                                  publisherModelDatum: homecontroller
                                      .publisherModel!.data![index],
                                )),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            activeColor: Colors.black,
            color: Colors.grey,
            tabBackgroundColor: Colors.white,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.explore, text: "Discover"),
              GButton(icon: Icons.bookmark_rounded, text: "Bookmarks"),
              GButton(icon: Icons.person, text: "Profile")
            ],
          ),
        ),
      ),
    );
  }
}
