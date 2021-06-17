// To parse this JSON data, do
//
//     final tagList = tagListFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

TagList tagListFromJson(String str) => TagList.fromJson(json.decode(str));

String tagListToJson(TagList data) => json.encode(data.toJson());

class TagList {
  TagList({
    this.id,
    this.tagName,
    this.tagImage,
  });

  int id;
  String tagName;
  IconData tagImage;

  factory TagList.fromJson(Map<String, dynamic> json) => TagList(
        id: json["id"],
        tagName: json["tag_name"],
        tagImage: json["tag_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag_name": tagName,
        "tag_image": tagImage,
      };
}
