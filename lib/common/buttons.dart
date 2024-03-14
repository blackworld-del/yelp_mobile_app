// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp/utils/device_size.dart';

import '../constant/colors.dart';

Widget customButton({
  required BuildContext context,
  required Widget child,
  required Color backgroundColor,
}) {
  return Container(
    width: deviceHeight(context: context) * 0.4,
    height: deviceHeight(context: context) * 0.06,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      border: Border.all(
        color: YelpColors.backGroundColor,
      ),
    ),
    child: Center(
      child: child,
    ),
  );
}
