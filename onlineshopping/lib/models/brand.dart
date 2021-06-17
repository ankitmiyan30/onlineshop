import 'dart:convert';

import 'package:flutter/material.dart';

Brand brandFromJson(String str) => Brand.fromJson(json.decode(str));

String brandToJson(Brand data) => json.encode(data.toJson());

class Brand {
  Brand({
    this.id,
    this.brandName,
    this.brandImage,
  });

  int id;
  String brandName;
  IconData brandImage;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        brandName: json["brand_name"],
        brandImage: json["brand_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand_name": brandName,
        "brand_image": brandImage,
      };
}
