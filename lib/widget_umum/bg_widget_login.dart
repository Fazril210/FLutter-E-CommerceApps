
import 'package:flutter/material.dart';
import 'package:biu_merch/consts/consts.dart';

Widget bgWidgetLogin({Widget? child}) {
  return Stack(
    children: [
      // Background image
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgLoginLatar),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
      // Gradient overlay
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              putih.withOpacity(0.3),
              putih.withOpacity(0.7),
              putih
            ],
            stops: const [0.3, 0.5, 0.7, 0.9],
          ),
        ),
      ),
      // Child content
      if (child != null) child,
    ],
  );
}