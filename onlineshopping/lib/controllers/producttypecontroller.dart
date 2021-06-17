import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:onlineshopping/models/category.dart';
import 'package:onlineshopping/utils/shopxhelper.dart';

class ProductTypeController extends GetxController {
  var productTypeList = List<ProductType>().obs;
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  void fetchCategory() async {
    List<ProductType> proList = List();
    var list = [
      "pencil",
      "lipstick",
      "liquid",
      "powder",
      "lip_gloss",
      "gel",
      "cream",
      "palette",
      "concealer",
      "highlighter",
      "bb_cc",
      "contour",
      "lip_stain",
      "mineral"
    ];

    for (final cat in list) {
      proList.add(
        ProductType(
            id: list.indexOf(cat),
            categoryName: ShopXHelper.capitalize(cat),
            categoryImage: Icons.image),
      );
    }
    productTypeList.value = proList;
  }
}
