import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

double deviceHeight({
  required BuildContext context,
}) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth({
  required BuildContext context,
}) {
  return MediaQuery.of(context).size.width;
}
