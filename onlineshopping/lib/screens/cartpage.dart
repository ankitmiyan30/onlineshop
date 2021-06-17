import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/components/cart_tile.dart';
import 'package:onlineshopping/components/title_text_widget.dart';
import 'package:onlineshopping/controllers/cartcontroller.dart';
import 'package:get/get.dart';
import 'package:onlineshopping/utils/app_colors.dart';

class CartListScreen extends StatefulWidget {
  @override
  _CartListScreenState createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final CartController cartController = Get.put(CartController());

  @override
  void dispose() {
    // cartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    cartController.cartItemsSet();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: HeadingTextWidget(
          context: context,
          text: "My Cart",
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            buildProductList(),
          ],
        ),
      ),
      floatingActionButton: GetX<CartController>(builder: (controller) {
        return FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(
            Icons.attach_money_sharp,
            size: 32,
          ), //${controller.totalItems}
          label: Container(
            alignment: Alignment.center,
            width: ResponsiveFlutter.of(context).wp(60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cartController.totalAmount.toStringAsFixed(2),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.8)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Text(
                      "Place Order",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.8),
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildProductList() {
    return Expanded(
      child: Obx(() {
        return cartController.cartItemSet.length > 0
            ? StaggeredGridView.countBuilder(
                crossAxisCount: 1,
                itemCount: cartController.cartItemSet.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return CartTile(cartController.cartItemSet.elementAt(index));
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_shopping_cart,
                      color: Colors.red.withOpacity(0.9),
                      size: ResponsiveFlutter.of(context).hp(20),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        "Your cart is empty!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: ResponsiveFlutter.of(context).fontSize(3),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        "Add items to it now.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: AppColors.shadowcolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.all(8),
                      color: AppColors.color1,
                      child: Text(
                        "Shop now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}

// StaggeredGridView.countBuilder(
//                 crossAxisCount: 2,
//                 itemCount: cartController.cartItemSet.length,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 itemBuilder: (context, index) {
//                   return CartTile(cartController.cartItemSet.elementAt(index));
//                 },
//                 staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//               )
