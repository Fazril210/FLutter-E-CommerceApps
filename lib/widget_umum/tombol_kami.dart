import 'package:biu_merch/consts/consts.dart';
import 'package:flutter/material.dart';

Widget tombolKami({
  VoidCallback? onPress, 
  Color? color, 
  Color? textColor, 
  String? title
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
      ),
    ),
    onPressed: onPress,
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
