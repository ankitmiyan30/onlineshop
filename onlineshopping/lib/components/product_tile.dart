import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/controllers/cartcontroller.dart';
import 'package:onlineshopping/controllers/productcontroller.dart';
import 'package:onlineshopping/models/product.dart';
import 'package:onlineshopping/utils/app_colors.dart';

class ProductTile extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final ProductController productController = Get.put(ProductController());
  final Product product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(
                    () => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: product.isFavorite.value
                            ? Icon(
                                Icons.favorite_rounded,
                                color: Colors.red.withOpacity(0.9),
                              )
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          product.isFavorite.toggle();
                          productController.favouriteList();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(3),
                      fontFamily: 'avenir'),
                ),
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.color1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          cartController.removeProduct(product);
                          cartController.cartItemsSet();
                        },
                        child: Icon(
                          Icons.remove,
                          size: 24,
                          color: AppColors.color1,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Obx(
                          () => Text(
                            cartController
                                .countOfParticular(product)
                                .toString(),
                            style: TextStyle(
                              color: AppColors.shadowcolor,
                              fontWeight: FontWeight.w900,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          cartController.addToCart(product);
                          cartController.cartItemsSet();
                        },
                        child: Icon(
                          Icons.add,
                          size: 24,
                          color: AppColors.color1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
