import 'package:flutter/widgets.dart';

class ScreenUtil {
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleFactor;
  static double screenWidthUI = 375;
  static double screenHeightUI = 812;

  static void init(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width / screenWidthUI;
    screenHeight = mediaQuery.size.height / screenHeightUI;
    scaleFactor = (screenWidth + screenHeight) / 2;
  }

  static double getScaleFactor() {
    return scaleFactor;
  }

  static double getWidth(double designWidth) {
    return designWidth * screenWidth;
  }

  static double getHeight(double designHeight) {
    return designHeight * screenHeight;
  }

  static double getFontSize(double designFontSize) {
    return designFontSize * scaleFactor;
  }

  static double getRadius(double designRadius) {
    return designRadius * scaleFactor;
  }

  static double getEqualSize(double designRadius) {
    return designRadius * scaleFactor;
  }

  static EdgeInsets getPadding(double padding) {
    double scaledPadding = padding * getScaleFactor();
    return EdgeInsets.all(scaledPadding);
  }
}

extension IntSizeExtension on int {
  double get w => ScreenUtil.getWidth(toDouble());
  double get h => ScreenUtil.getHeight(toDouble());
  double get f => ScreenUtil.getFontSize(toDouble());
  double get r => ScreenUtil.getRadius(toDouble());
  double get e => ScreenUtil.getEqualSize(toDouble());
}

extension SizeExtension on double {
  double get w => ScreenUtil.getWidth(this);
  double get h => ScreenUtil.getHeight(this);
  double get f => ScreenUtil.getFontSize(this);
  double get r => ScreenUtil.getRadius(this);
  double get e => ScreenUtil.getEqualSize(this);
}

extension PaddingExtension on double {
  EdgeInsets get p => ScreenUtil.getPadding(this);
}

extension IntPaddingExtension on int {
  EdgeInsets get p => ScreenUtil.getPadding(toDouble());
}
