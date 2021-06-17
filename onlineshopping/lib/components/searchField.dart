import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:onlineshopping/utils/app_colors.dart';

class RoundedInputField extends StatelessWidget {
  final Widget child;
  const RoundedInputField({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        width: ResponsiveFlutter.of(context).wp(90),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withOpacity(0.4))),
        child: child,
      ),
    );
  }
}

class RoundedSearchField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmit;
  final TextEditingController textFieldController;
  const RoundedSearchField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.onSubmit,
    this.textFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedInputField(
      child: TextField(
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal,
          fontSize: ResponsiveFlutter.of(context).fontSize(2),
        ),
        textInputAction: TextInputAction.search,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.shadowcolor,
            fontFamily: 'Muli',
            fontWeight: FontWeight.normal,
            fontSize: ResponsiveFlutter.of(context).fontSize(2),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.shadowcolor,
          ),
          suffixIcon: Icon(
            Icons.mic,
            color: AppColors.shadowcolor,
          ),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
        onSubmitted: onSubmit,
        controller: textFieldController,
      ),
    );
  }
}
