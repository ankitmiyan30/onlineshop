import 'dart:convert';

import 'package:flutter/material.dart';

ProductType categoryFromJson(String str) =>
    ProductType.fromJson(json.decode(str));

String categoryToJson(ProductType data) => json.encode(data.toJson());

class ProductType {
  ProductType({
    this.id,
    this.categoryName,
    this.categoryImage,
  });

  int id;
  String categoryName;
  IconData categoryImage;

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_image": categoryImage,
      };
}
