import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/models/brand.dart';
import 'package:onlineshopping/utils/app_colors.dart';
import 'package:onlineshopping/utils/shopxhelper.dart';

class BrandTile extends StatelessWidget {
  final Brand brand;
  const BrandTile(this.brand);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   brand.brandImage,
            //   color: AppColors.shadowcolor,
            //   size: ResponsiveFlutter.of(context).hp(6),
            // ),
            Text(
              ShopXHelper.getInitials(brand.brandName).toUpperCase(),
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: ResponsiveFlutter.of(context).fontSize(5),
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              ShopXHelper.capitalize(brand.brandName),
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
