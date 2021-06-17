import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:onlineshopping/models/taglist.dart';
import 'package:onlineshopping/utils/shopxhelper.dart';

class TagController extends GetxController {
  var tagList = List<TagList>().obs;
  void onInit() {
    fetchTags();
    super.onInit();
  }

  void fetchTags() async {
    List<TagList> taglist = List();
    var list = [
      "cruelty free",
      "Vegan"
          "Chemical Free",
      "Organic"
          "water free",
      "alcohol free",
      "oil free",
      "silicone free",
      "Vegan",
      "Gluten Free"
          "purpicks",
      "EcoCert"
          "EWG Verified",
      "purpicks"
          "Hypoallergenic",
      "No Talc"
          "CertClean",
      "CertClean"
          "USDA Organic",
      "Canadian"
          "Natural",
      "Gluten Free",
      "Natural"
          "Canadian",
      "Organic",
      "Non-GMO",
      "Fair Trade",
      "Sugar Free",
      "Dairy Free",
      "Peanut Free Product",
    ];
    taglist.add(
      TagList(id: 0, tagName: "All Tags", tagImage: Icons.image),
    );
    for (final cat in list) {
      taglist.add(
        TagList(
            id: list.indexOf(cat) + 1,
            tagName: ShopXHelper.capitalize(cat),
            tagImage: Icons.image),
      );
    }
    tagList.value = taglist;
  }
}
