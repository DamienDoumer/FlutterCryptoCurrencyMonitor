
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app_colors.dart';

class AppStyles {
  
  static String formatNumber(num? number) {
    var formated = NumberFormat.compactCurrency(decimalDigits: 2, symbol: '').format(number);
    return formated.toString();
  }

  static TextStyle cryptoListHeaderTextStyle() {
    return TextStyle(color: AppColors.secondaryTextColor, fontSize: 20);
  }

  static Widget buildLoadingUI() {
    return const Center(child: Text("Loading..."));
  }

  static TextStyle h1TextStyle() {
    return TextStyle(color: AppColors.textColor, fontSize: 20);
  }

  static TextStyle normalTextStyle() {
    return TextStyle(color: AppColors.textColor, fontSize: 13, overflow: TextOverflow.ellipsis);
  }

  static TextStyle secondaryTextStyle() {
    return TextStyle(color: AppColors.secondaryTextColor, fontSize: 13);
  }
}