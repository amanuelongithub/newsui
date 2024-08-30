// To parse this JSON data, do
//
//     final publisherModel = publisherModelFromJson(jsonString);

import 'dart:convert';

PublisherModel publisherModelFromJson(String str) => PublisherModel.fromJson(json.decode(str));

String publisherModelToJson(PublisherModel data) => json.encode(data.toJson());

class PublisherModel {
    final List<PublisherModelDatum>? data;

    PublisherModel({
        this.data,
    });

    factory PublisherModel.fromJson(Map<String, dynamic> json) => PublisherModel(
        data: json["data"] == null ? [] : List<PublisherModelDatum>.from(json["data"]!.map((x) => PublisherModelDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class PublisherModelDatum {
    final String? name;
    final String? title;
    final String? slug;
    final String? img;
    final int? totalNewsPost;
    final int? followers;
    final int? following;
    final bool? isUserfolow;
    final bool? isVerifid;
    final List<DatumDatum>? data;

    PublisherModelDatum({
        this.name,
        this.title,
        this.slug,
        this.img,
        this.totalNewsPost,
        this.followers,
        this.following,
        this.isUserfolow,
        this.isVerifid,
        this.data,
    });

    factory PublisherModelDatum.fromJson(Map<String, dynamic> json) => PublisherModelDatum(
        name: json["name"],
        title: json["title"],
        slug: json["slug"],
        img: json["img"],
        totalNewsPost: json["total_news_post"],
        followers: json["followers"],
        following: json["following"],
        isUserfolow: json["isUserfolow"],
        isVerifid: json["isVerifid"],
        data: json["data"] == null ? [] : List<DatumDatum>.from(json["data"]!.map((x) => DatumDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "slug": slug,
        "img": img,
        "total_news_post": totalNewsPost,
        "followers": followers,
        "following": following,
        "isUserfolow": isUserfolow,
        "isVerifid": isVerifid,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DatumDatum {
    final String? title;
    final String? category;
    final String? image;
    final DateTime? publishedDate;

    DatumDatum({
        this.title,
        this.category,
        this.image,
        this.publishedDate,
    });

    factory DatumDatum.fromJson(Map<String, dynamic> json) => DatumDatum(
        title: json["title"],
        category: json["category"],
        image: json["image"],
        publishedDate: json["published_date"] == null ? null : DateTime.parse(json["published_date"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "category": category,
        "image": image,
        "published_date": publishedDate?.toIso8601String(),
    };
}
