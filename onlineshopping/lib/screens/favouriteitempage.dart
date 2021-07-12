import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/components/product_tile.dart';
import 'package:onlineshopping/components/title_text_widget.dart';
import 'package:onlineshopping/controllers/productcontroller.dart';
import 'package:get/get.dart';
import 'package:onlineshopping/utils/app_colors.dart';
import 'package:onlineshopping/utils/strings.dart';

class FavouriteListScreen extends StatefulWidget {
  @override
  _FavouriteListScreenState createState() => _FavouriteListScreenState();
}

class _FavouriteListScreenState extends State<FavouriteListScreen> {
  final ProductController productController = Get.put(ProductController());
  @override
  void dispose() {
    // productController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: HeadingTextWidget(
          context: context,
          text: "Favourite",
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
    );
  }

  Widget buildProductList() {
    productController.favouriteList();
    return Expanded(
      child: Obx(
        () {
          return productController.favProductsList.length > 0
              ? StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.favProductsList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(
                        productController.favProductsList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                )
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red.withOpacity(0.9),
                        size: ResponsiveFlutter.of(context).hp(20),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Text(
                          Strings.emptyFavourite,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: ResponsiveFlutter.of(context).fontSize(3),
                            color: Colors.black,
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
                          Strings.findFavouriteButton,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
