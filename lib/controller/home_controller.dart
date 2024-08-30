import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jobtest/model/newscard_model.dart';
import 'package:jobtest/model/publisher_model.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  bool isError = false;
  String? errorMessage = '';

  NewsCardModel? newsCardModel;
  PublisherModel? publisherModel;

  @override
  onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    isLoading = true;
    update();

    await rootBundle
        .loadString('assets/files/news.json')
        .then((String jsonString) {
      newsCardModel = newsCardFromJson(jsonString);
    }).catchError((e) {});

    await rootBundle
        .loadString('assets/files/list_of_publisher.json')
        .then((String jsonString) {
      publisherModel = publisherModelFromJson(jsonString);
    }).catchError((e) {});

    isLoading = false;
    update();
  }
}
