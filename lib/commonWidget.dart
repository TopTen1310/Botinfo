import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonWidget {
  static var slideTwo = Color(0xffbd0010);

  static var orange = Color(0xffed9615);
  static var black = Color(0xff4e4e4e);
  static var green = Color(0xff426805);
  static var white = Color(0xffffffff);
  static var gray = Color(0xff999999);

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static px(context, size) {
    return (MediaQuery.of(context).size.width / 1080) /
        (MediaQuery.of(context).size.height / 2300);
  }

  static double height(context, height) {
    return MediaQuery.of(context).size.height * (height / 2300);
  }

  static double width(context, width) {
    return width * (MediaQuery.of(context).size.width / 1080);
  }

  static Widget commonText(
    String text,
    double textSize, {
    color,
    fontWeight,
    maxline,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: textSize,
        color: color,
        fontWeight: fontWeight,
      ),
      maxLines: maxline,
    );
  }
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
