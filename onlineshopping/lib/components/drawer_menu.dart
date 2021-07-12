import 'package:flutter/material.dart';
import 'package:onlineshopping/utils/app_colors.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  const DrawerMenuItem({
    Key key,
    this.icon = Icons.add_business,
    this.text = "Menu Title",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        onTap: () {
          onTap();
        },
        horizontalTitleGap: 16.0,
        leading: MaterialButton(
            onPressed: () {
              onTap();
            },
            color: Colors.white,
            textColor: AppColors.color3,
            child: Icon(
              icon,
              size: 18,
            ),
            padding: EdgeInsets.all(16),
            shape: CircleBorder()),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
