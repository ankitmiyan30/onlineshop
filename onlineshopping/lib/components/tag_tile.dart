import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/models/category.dart';
import 'package:onlineshopping/models/taglist.dart';
import 'package:onlineshopping/utils/shopxhelper.dart';

class ProductTypeTile extends StatelessWidget {
  final ProductType tag;
  const ProductTypeTile(this.tag);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Icon(
            //   brand.brandImage,
            //   color: AppColors.shadowcolor,
            //   size: ResponsiveFlutter.of(context).hp(6),
            // ),
            Text(
              ShopXHelper.getInitials(tag.categoryName).toUpperCase(),
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: ResponsiveFlutter.of(context).fontSize(2),
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              ShopXHelper.capitalize(tag.categoryName),
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.2),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
