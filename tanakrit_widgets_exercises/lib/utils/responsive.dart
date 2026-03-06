import 'package:flutter/material.dart';

class Responsive {

  // breakpoints
  static const double mobile = 600;
  static const double tablet = 900;

  // ======================
  // Screen Size
  // ======================

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobile &&
      MediaQuery.of(context).size.width < tablet;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tablet;

  // ======================
  // Orientation
  // ======================

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // ======================
  // Padding Responsive
  // ======================

  static EdgeInsets getScreenPadding(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    if (width < mobile) {
      return const EdgeInsets.all(12);
    } else if (width < tablet) {
      return const EdgeInsets.all(20);
    } else {
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 20);
    }
  }

  // ======================
  // Grid Columns
  // ======================

  static int getColumnCount(double width) {
    if (width < mobile) return 1;
    if (width < tablet) return 2;
    return 3;
  }
}