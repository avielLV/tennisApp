import 'package:flutter/material.dart';

class DialogHelper {
  static show(BuildContext context, Widget widget) =>
      showDialog(context: context, builder: (context) => widget);
}
