import 'package:biu_merch/consts/consts.dart';
import 'package:biu_merch/views/autentikasi/halaman_daftar.dart';
import 'package:biu_merch/views/autentikasi/halaman_login.dart';
import 'package:biu_merch/widget_umum/bg_widget_login.dart';
import 'package:biu_merch/widget_umum/logoaplikasi_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidgetLogin(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logoaplikasiWidget(),
                  welcome.text
                      .fontFamily(extrabold)
                      .color(hijauTua)
                      .center
                      .size(35)
                      .make(),
                  30.heightBox,
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: hijauTua, 
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Get.to(() => const HalamanLogin());
                      },
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        masuk,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: bold, 
                          color: putihTerang, 
                        ),
                      ),
                    ),
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: hijauTua), 
                      borderRadius: BorderRadius.circular(8),
                      color: putihTerang, 
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Get.to(() => const HalamanDaftar());
                      },
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        daftar,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: bold, 
                          color: hijauTua, 
                        ),
                      ),
                    ),
                  ).box.width(context.screenWidth - 50).make(),
                  50.heightBox, // Optional spacing
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
