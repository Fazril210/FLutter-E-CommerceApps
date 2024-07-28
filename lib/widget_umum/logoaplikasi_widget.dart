import 'package:biu_merch/consts/consts.dart';
import 'package:flutter/material.dart';

Widget logoaplikasiWidget() {
  return Image.asset(icAplikasi)
      .box
      .transparent  
      .size(180, 180)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
