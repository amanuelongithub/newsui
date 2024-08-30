import 'dart:convert';

NewsCardModel newsCardFromJson(String str) => NewsCardModel.fromJson(json.decode(str));

String newsCardToJson(NewsCardModel data) => json.encode(data.toJson());

class NewsCardModel {
    final bool? success;
    final Data? data;

    NewsCardModel({
        this.success,
        this.data,
    });

    factory NewsCardModel.fromJson(Map<String, dynamic> json) => NewsCardModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    final PageMetadata? pageMetadata;
    final List<Datum>? data;

    Data({
        this.pageMetadata,
        this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageMetadata: json["page_metadata"] == null ? null : PageMetadata.fromJson(json["page_metadata"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page_metadata": pageMetadata?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? title;
    final String? category;
    final String? image;
    final Publisher? publisher;
    final DateTime? publishedDate;

    Datum({
        this.title,
        this.category,
        this.image,
        this.publisher,
        this.publishedDate,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        category: json["category"],
        image: json["image"],
        publisher: json["publisher"] == null ? null : Publisher.fromJson(json["publisher"]),
        publishedDate: json["published_date"] == null ? null : DateTime.parse(json["published_date"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "category": category,
        "image": image,
        "publisher": publisher?.toJson(),
        "published_date": publishedDate?.toIso8601String(),
    };
}

class Publisher {
    final String? name;
    final bool? isVerifide;
    final String? img;
    final bool? isUserFollow;

    Publisher({
        this.name,
        this.isVerifide,
        this.img,
        this.isUserFollow,
    });

    factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        name: json["name"],
        isVerifide: json["isVerifide"],
        img: json["img"],
        isUserFollow: json["isUserFollow"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "isVerifide": isVerifide,
        "img": img,
        "isUserFollow": isUserFollow,
    };
}

class PageMetadata {
    final int? length;
    final int? size;
    final int? page;
    final int? lastPage;
    final int? startIndex;
    final int? endIndex;

    PageMetadata({
        this.length,
        this.size,
        this.page,
        this.lastPage,
        this.startIndex,
        this.endIndex,
    });

    factory PageMetadata.fromJson(Map<String, dynamic> json) => PageMetadata(
        length: json["length"],
        size: json["size"],
        page: json["page"],
        lastPage: json["last_page"],
        startIndex: json["start_index"],
        endIndex: json["end_index"],
    );

    Map<String, dynamic> toJson() => {
        "length": length,
        "size": size,
        "page": page,
        "last_page": lastPage,
        "start_index": startIndex,
        "end_index": endIndex,
    };
}
