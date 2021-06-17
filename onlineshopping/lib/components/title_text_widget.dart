import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  final Alignment alignment;
  const TitleTextWidget({
    Key key,
    @required this.context,
    this.text,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, bottom: 15.0, right: 20.0, top: 12),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: ResponsiveFlutter.of(context).fontSize(3.5)),
          ),
        ),
      ),
    );
  }
}

class HeadingTextWidget extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final Color color;
  final double size;
  const HeadingTextWidget({
    Key key,
    @required this.context,
    this.text,
    this.alignment = Alignment.center,
    this.color = Colors.white,
    this.size = 3,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'After_shok',
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: ResponsiveFlutter.of(context).fontSize(this.size)),
        ),
      ),
    );
  }
}
