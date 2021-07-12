import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlineshopping/components/drawer_menu.dart';
import 'package:onlineshopping/screens/cartpage.dart';
import 'package:onlineshopping/screens/favouriteitempage.dart';
import 'package:onlineshopping/utils/app_colors.dart';
import 'package:onlineshopping/utils/app_icons.dart';

class NavigationDrawerMenu extends StatefulWidget {
  const NavigationDrawerMenu({Key key}) : super(key: key);

  @override
  _NavigationDrawerMenuState createState() => _NavigationDrawerMenuState();
}

class _NavigationDrawerMenuState extends State<NavigationDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 180,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 140.0,
                          height: 140.0,
                          child: Image.asset(AppIcons.profileImage),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: MaterialButton(
                              onPressed: () {
                                print("edit icon clicked");
                              },
                              color: Colors.white,
                              textColor: AppColors.color3,
                              child: Icon(
                                Icons.edit,
                                size: 24,
                              ),
                              padding: EdgeInsets.all(16),
                              shape: CircleBorder()),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Anthony Ankit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0)),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerMenuItem(
                      text: "Add New Product",
                      icon: Icons.add_business,
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      text: "Favourite Item",
                      icon: Icons.favorite,
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(() => FavouriteListScreen());
                        // Get.to(FavouriteListScreen());
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FavouriteListScreen(),
                        //   ),
                        // );
                      },
                    ),
                    DrawerMenuItem(
                      text: "My Cart",
                      icon: Icons.badge,
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(() => CartListScreen());
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => CartListScreen(),
                        //   ),
                        // );
                      },
                    ),
                    DrawerMenuItem(
                      text: "My Winnings",
                      icon: Icons.title,
                      onTap: () {},
                    ),
                    DrawerMenuItem(
                      text: "My Address",
                      icon: Icons.local_post_office,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  padding: EdgeInsets.all(4.0),
                  textColor: AppColors.color3,
                  color: Colors.white,
                  onPressed: () {},
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
