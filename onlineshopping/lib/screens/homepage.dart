import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
// import 'package:flutter_native_admob/flutter_native_admob.dart';
// import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/components/brand_tile.dart';
import 'package:onlineshopping/components/searchField.dart';
import 'package:onlineshopping/components/tag_tile.dart';
import 'package:onlineshopping/components/title_text_widget.dart';
import 'package:onlineshopping/controllers/brandcontroller.dart';
import 'package:onlineshopping/controllers/cartcontroller.dart';
import 'package:onlineshopping/controllers/producttypecontroller.dart';
import 'package:onlineshopping/controllers/productcontroller.dart';
import 'package:onlineshopping/controllers/tagcontroller.dart';
import 'package:onlineshopping/screens/cartpage.dart';
import 'package:onlineshopping/screens/favouriteitempage.dart';
import 'package:onlineshopping/screens/productdetailspage.dart';
import 'package:onlineshopping/screens/productslist.dart';
import 'package:onlineshopping/utils/app_colors.dart';
import 'package:onlineshopping/utils/app_icons.dart';
import 'package:onlineshopping/utils/shopxhelper.dart';
import 'package:onlineshopping/utils/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = Get.put(ProductController());
  final BrandController brandController = Get.put(BrandController());
  final TagController tagController = Get.put(TagController());
  final CartController cartController = Get.put(CartController());
  final ProductTypeController productTypeController =
      Get.put(ProductTypeController());
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  TextEditingController searchBusinessTFController = TextEditingController();

  // @override
  // void dispose() {
  //   TODO: implement dispose
  //   productController.dispose();
  //   brandController.dispose();
  //   tagController.dispose();
  //   cartController.dispose();
  //   productTypeController.dispose();
  //   super.dispose();
  // }
  void _toggle() {
    _innerDrawerKey.currentState.toggle(
        // direction is optional
        // if not set, the last direction will be used
        //InnerDrawerDirection.start OR InnerDrawerDirection.end
        direction: InnerDrawerDirection.start);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return
        // InnerDrawer(
        //   key: _innerDrawerKey,
        //   onTapClose: true, // default false
        //   swipe: true, // default true
        //   // colorTransitionChild: Colors.red, // default Color.black54
        //   colorTransitionScaffold: Colors.black54, // default Color.black54

        //   //When setting the vertical offset, be sure to use only top or bottom
        //   offset: IDOffset.only(right: 0.05, left: 0.0, top: 0.0),

        //   scale: IDOffset.horizontal(0.8), // set the offset in both directions

        //   proportionalChildArea: false, // default true
        //   borderRadius: 10, // default 0
        //   leftAnimationType: InnerDrawerAnimation.static, // default static
        //   // rightAnimationType: InnerDrawerAnimation.static,
        //   // backgroundDecoration: BoxDecoration(
        //   //   color: Colors.white,
        //   // ), // default  Theme.of(context).backgroundColor

        //   //when a pointer that is in contact with the screen and moves to the right or left
        //   // onDragUpdate: (double val, InnerDrawerDirection direction) {
        //   //   // return values between 1 and 0
        //   //   print(val);
        //   //   // check if the swipe is to the right or to the left
        //   //   print(direction == InnerDrawerDirection.start);
        //   // },

        //   // innerDrawerCallback: (a) =>
        //   // print(a), // return  true (open) or false (close)
        //   leftChild: Container(
        //       child: FlatButton(
        //     child: Text("Click Me"),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => FavouriteListScreen(),
        //         ),
        //       );
        //       _toggle();
        //     },
        //   )), // required if rightChild is not set
        //   rightChild: null, // required if leftChild is not set
        //   scaffold:
        Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          child: FlatButton(
            child: Text("Click Me"),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouriteListScreen(),
                ),
              );
            },
          ),
        ), //
      ),
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            // _toggle();
            _scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            size: 30,
          ),
        ),
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
                  )
                ],
              ),
            ],
          )
        ],
        title: HeadingTextWidget(
          context: context,
          text: Strings.appname,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildRoundedSearchField(),
                buildCategoryCard(),
                buildAdvertisementContainer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      HeadingTextWidget(
                        context: context,
                        text: "Brands",
                        color: AppColors.primary,
                        size: 2,
                      ),
                      buildBrandList(),
                      SizedBox(
                        height: 8,
                      ),
                      buildSeeMore(),
                      HeadingTextWidget(
                        context: context,
                        text: "Products",
                        color: AppColors.primary,
                        size: 2,
                      ),
                      buildProductTypeList(),
                      SizedBox(
                        height: 8,
                      ),
                      buildProductTypeSeeMore(),
                      SizedBox(
                        height: 8,
                      ),
                      // buildProductList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // );
  }

  Widget buildSeeMore() {
    return Obx(() {
      return brandController.brandList.length > 6
          ? Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "See More",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2)),
                  ),
                ],
              ),
            )
          : Container();
    });
  }

  Widget buildProductTypeSeeMore() {
    return Obx(() {
      return productTypeController.productTypeList.length > 15
          ? Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "See More",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2)),
                  ),
                ],
              ),
            )
          : Container();
    });
  }

  Widget buildBrandList() {
    return Obx(() {
      return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
            brandController.brandList.length > 6
                ? 6
                : brandController.brandList.length, (index) {
          return InkWell(
            child: BrandTile(brandController.brandList[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListScreen(
                      brand: brandController.brandList[index]),
                ),
              );
            },
          );
        }),
      );
    });
  }

  Widget buildProductTypeList() {
    return Obx(() {
      return GridView.count(
        crossAxisCount: 5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
            productTypeController.productTypeList.length > 15
                ? 15
                : productTypeController.productTypeList.length, (index) {
          return InkWell(
            child:
                ProductTypeTile(productTypeController.productTypeList[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListScreen(
                      productType:
                          productTypeController.productTypeList[index]),
                ),
              );
            },
          );
        }),
      );
    });
  }

  Widget buildCategoryCard() {
    return Obx(() {
      return Card(
        margin: EdgeInsets.zero,
        elevation: 2,
        child: Container(
          height: ResponsiveFlutter.of(context).hp(8),
          alignment: Alignment.topLeft,
          color: AppColors.white,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final tag in tagController.tagList)
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          width: ResponsiveFlutter.of(context).wp(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Icon(
                              //   category.categoryImage,
                              //   color: AppColors.shadowcolor,
                              //   size: ResponsiveFlutter.of(context).hp(5),
                              // ),
                              Text(
                                ShopXHelper.getInitials(tag.tagName)
                                    .toUpperCase(),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(3),
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                tag.tagName,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              )),
        ),
      );
    });
  }

  Widget buildRoundedSearchField() {
    return Container(
      color: AppColors.primary,
      child: RoundedSearchField(
        hintText: "Search for products, Brands and More",
        icon: Icons.search_sharp,
        textFieldController: searchBusinessTFController,
        onChanged: (value) {},
        onSubmit: (v) {
          if (searchBusinessTFController.text != "") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildAdvertisementContainer() {
    return CarouselSlider(
      options: CarouselOptions(
        height: ResponsiveFlutter.of(context).hp(22),
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInCubic,
        enlargeCenterPage: false,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [AppIcons.dummyImage1, AppIcons.dummyImage2, AppIcons.dummyImage3]
          .map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: ResponsiveFlutter.of(context).wp(100),
              child: Card(
                elevation: 4,
                color: Colors.white,
                child:
                    // NativeAdmob(
                    //   adUnitID: NativeAd.testAdUnitId,
                    //   controller: _nativeAdController,
                    //   type: NativeAdmobType.full,
                    //   loading: Center(child: CircularProgressIndicator()),
                    //   error: Text('failed to load'),
                    // )
                    Image.asset(
                  i,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
