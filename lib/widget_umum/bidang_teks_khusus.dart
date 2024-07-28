import 'package:biu_merch/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bidangTeksKhusus({String? title, String? hint, TextEditingController? controller, bool isPass = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(hijauTua).fontFamily(bold).size(18).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: hijauTua.withOpacity(0.5), 
            fontWeight: FontWeight.w100,
          ),
          hintText: hint,
          isDense: true,
          fillColor: putih,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: hijauTua),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      5.heightBox,
    ],
  );
}
