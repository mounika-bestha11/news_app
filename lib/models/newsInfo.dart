// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';
//import 'dart:ffi';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String status;
  int totalResults;
  List<Article> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

enum Id { THE_WALL_STREET_JOURNAL }

final idValues =
    EnumValues({"the-wall-street-journal": Id.THE_WALL_STREET_JOURNAL});

enum Name { THE_WALL_STREET_JOURNAL }

final nameValues =
    EnumValues({"The Wall Street Journal": Name.THE_WALL_STREET_JOURNAL});

class Source {
  Source({
    required this.id,
    required this.name,
  });

  dynamic id;
  dynamic name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
