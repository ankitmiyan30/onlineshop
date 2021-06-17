import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/controllers/cartcontroller.dart';
import 'package:onlineshopping/controllers/productcontroller.dart';
import 'package:onlineshopping/models/product.dart';
import 'package:onlineshopping/utils/app_colors.dart';

class CartTile extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final ProductController productController = Get.put(ProductController());
  final Product product;
  CartTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: ResponsiveFlutter.of(context).wp(60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w800),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    if (product.rating != null)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
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
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(3),
                          fontFamily: 'avenir'),
                    ),
                  ],
                ),
              ),
              Container(
                width: ResponsiveFlutter.of(context).wp(25),
                child: Column(
                  children: [
                    Container(
                      height: ResponsiveFlutter.of(context).hp(15),
                      width: ResponsiveFlutter.of(context).wp(20),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.network(
                        product.imageLink,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.color1),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
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
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(2.2),
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
            ],
          ),
        ),
      ),
    );
  }
}
