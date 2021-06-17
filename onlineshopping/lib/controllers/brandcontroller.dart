import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:onlineshopping/models/brand.dart';
import 'package:onlineshopping/utils/shopxhelper.dart';

class BrandController extends GetxController {
  var brandList = List<Brand>().obs;
  var brandlocallist = [
    "colourpop",
    "boosh",
    "deciem",
    "zorah biocosmetiques",
    "w3llpeople",
    "sally b's skin yummies",
    "rejuva minerals",
    "penny lane organics",
    "nudus",
    "marienatie",
    "maia's mineral galaxy",
    "lotus cosmetics usa",
    "green people",
    "coastal classic creation",
    "c'est moi",
    "alva",
    "glossier",
    "nyx",
    "fenty",
    "clinique",
    "dior",
    "iman",
    "benefit",
    "smashbox",
    "marcelle",
    "stila",
    "mineral fusion",
    "annabelle",
    "dr. hauschka",
    "physicians formula",
    "cargo cosmetics",
    "covergirl",
    "e.l.f.",
    "maybelline",
    "almay",
    "milani",
    "pure anada",
    "l'oreal",
    "sante",
    "revlon",
    "anna sui",
    "wet n wild",
    "pacifica",
    "mistura",
    "zorah",
    "suncoat",
    "moov",
    "misa",
    "salon perfect",
    "orly",
    "china glaze",
    "essie",
    "butter london",
    "sinful colours",
    "piggy paint",
    "dalish",
    "burt's bees",
    "pure anada"
  ];
  @override
  void onInit() {
    super.onInit();
    fetchBrandList();
  }

  fetchBrandList() {
    for (final brand in brandlocallist) {
      brandList.add(Brand(
          id: brandlocallist.indexOf(brand),
          brandName: ShopXHelper.capitalize(brand),
          brandImage: Icons.image));
    }
  }
}
