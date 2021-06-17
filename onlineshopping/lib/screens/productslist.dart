import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/components/product_tile.dart';
import 'package:onlineshopping/components/title_text_widget.dart';
import 'package:onlineshopping/controllers/cartcontroller.dart';
import 'package:onlineshopping/controllers/productcontroller.dart';
import 'package:onlineshopping/models/brand.dart';
import 'package:onlineshopping/models/category.dart';
import 'package:onlineshopping/screens/cartpage.dart';
import 'package:onlineshopping/screens/favouriteitempage.dart';
import 'package:onlineshopping/utils/app_colors.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  final Brand brand;
  final ProductType productType;

  const ProductListScreen({Key key, this.brand, this.productType})
      : super(key: key);
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  int selectedRadioTile = 0;
  @override
  void dispose() {
    // productController.dispose();
    // cartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavouriteListScreen(),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    child: Obx(
                      () => productController.productList
                                  .where(
                                      // ignore: unrelated_type_equality_checks
                                      (product) => product.isFavorite == true)
                                  .length >
                              0
                          ? CircleAvatar(
                              child: Text(
                                productController.productList
                                    .where(
                                        // ignore: unrelated_type_equality_checks
                                        (product) => product.isFavorite == true)
                                    .length
                                    .toString(),
                                style: TextStyle(
                                    color: AppColors.background, fontSize: 8),
                              ),
                              radius: 8,
                              backgroundColor: Colors.red,
                            )
                          : Container(),
                    ),
                    right: 4,
                    top: 4,
                  )
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartListScreen(),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    child: Obx(
                      () => cartController.totalItems > 0
                          ? CircleAvatar(
                              child: Text(
                                cartController.totalItems.toString(),
                                style: TextStyle(
                                    color: AppColors.background, fontSize: 8),
                              ),
                              radius: 8,
                              backgroundColor: Colors.red,
                            )
                          : Container(),
                    ),
                    right: 4,
                    top: 4,
                  ),
                ],
              ),
            ],
          )
        ],
        title: HeadingTextWidget(
          context: context,
          text: this.widget.brand != null
              ? this.widget.brand.brandName
              : "Product List",
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
            buildFilterSortView(),
            Divider(
              height: 1,
            ),
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
    return Expanded(
      child: Obx(() {
        if (productController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: productController.productList.length,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            itemBuilder: (context, index) {
              return ProductTile(productController.productList[index]);
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          );
      }),
    );
  }

  Widget buildFilterSortView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              showSortSheet();
            },
            child: Container(
              width: ResponsiveFlutter.of(context).wp(40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.sort), onPressed: () {}),
                  InkWell(
                    onTap: () {
                      showSortSheet();
                    },
                    child: Text(
                      "Sort",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: ResponsiveFlutter.of(context).wp(40),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                Text(
                  "Filter",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showSortSheet() {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: ResponsiveFlutter.of(context).hp(30),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Text('SORT BY',
                      style: TextStyle(
                          fontSize: 18, color: AppColors.shadowcolor)),
                ),
                Divider(
                  height: 1,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    children: [
                      RadioListTile(
                        value: 0,
                        groupValue: selectedRadioTile,
                        title: Text(
                          "Popularity",
                          style:
                              TextStyle(color: AppColors.color6, fontSize: 18),
                        ),
                        onChanged: (val) {
                          if (mounted) {
                            setState(() {
                              selectedRadioTile = val;
                              productController.sortAsPopularity();
                            });
                          }
                          Navigator.pop(context);
                        },
                        activeColor: AppColors.color6,
                        selected: false,
                      ),
                      RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        title: Text(
                          "Price -- Low to High",
                          style:
                              TextStyle(color: AppColors.color6, fontSize: 18),
                        ),
                        onChanged: (val) {
                          if (mounted) {
                            setState(() {
                              selectedRadioTile = val;
                              productController.sortByLowToHigh();
                            });
                          }
                          Navigator.pop(context);
                        },
                        activeColor: AppColors.color6,
                        selected: false,
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile,
                        title: Text(
                          "Price -- High to Low",
                          style:
                              TextStyle(color: AppColors.color6, fontSize: 18),
                        ),
                        onChanged: (val) {
                          if (mounted) {
                            setState(() {
                              selectedRadioTile = val;
                              productController.sortByHighToLow();
                            });
                          }
                          Navigator.pop(context);
                        },
                        activeColor: AppColors.color6,
                        selected: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
