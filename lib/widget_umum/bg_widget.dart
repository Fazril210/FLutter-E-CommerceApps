import 'package:flutter/material.dart';
import 'package:biu_merch/consts/consts.dart';
import 'dart:ui';

Widget bgWidget({Widget? child, double opacity = 0.3}) {
  return Stack(
    children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgBackgroundAplikasi),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), // Adjust the blur values as needed
          child: Container(
            color: Colors.white.withOpacity(opacity), // Adjust the opacity value as needed
          ),
        ),
      ),
      if (child != null) child,
    ],
  );
}
