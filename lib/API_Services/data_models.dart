// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
List<ProductModel> postModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.rating,
  });

  final dynamic id;
  final String? title;
  final dynamic price;
  final String? category;
  final String? description;
  final String? image;
  final Rating? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        price: json["price"],
        category: json["category"] ?? "",
        description: json["description"] ?? "",
        image: json["image"] ?? "",
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "category": category,
        "description": description,
        "image": image,
        "rating": rating!.toJson(),
      };
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  final dynamic rate;
  final dynamic count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
