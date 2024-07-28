import 'package:biu_merch/consts/consts.dart';
import 'package:biu_merch/views/beranda/beranda.dart';
import 'package:biu_merch/views/controllers/auth_controller.dart';
import 'package:biu_merch/widget_umum/bidang_teks_khusus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui'; // Untuk ImageFilter

class HalamanLogin extends StatelessWidget {
  const HalamanLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgLoginLatar),
                  fit: BoxFit.cover,
                ),
              ),
              // Gradient overlay
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      putihTerang.withOpacity(0.3),
                      putihTerang.withOpacity(0.7),
                      putihTerang,
                    ],
                    stops: const [0.1, 0.3, 0.5, 0.7], 
                  ),
                ),
              ),
            ),
          ),
          // White background with blur effect
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 180),
                    login.text
                        .fontFamily(extrabold)
                        .color(hijauTua)
                        .center
                        .size(40)
                        .make(),
                    login2.text
                        .fontFamily(extrabold)
                        .color(hijauTua)
                        .center
                        .size(40)
                        .make(),
                    const SizedBox(height: 10),
                    login3.text
                        .fontFamily(bold)
                        .color(textAbu)
                        .center
                        .size(20)
                        .make(),
                    const SizedBox(height: 40),
                    bidangTeksKhusus(
                      hint: emailHint,
                      title: email,
                      isPass: false,
                      controller: controller.emaildanteleponController,
                    ),
                    const SizedBox(height: 15),
                    bidangTeksKhusus(
                      hint: passwordHint,
                      title: password,
                      isPass: true,
                      controller: controller.passwordController,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: lupaPassword.text.color(hijauTua).size(16).make(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(hijauTua),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: hijauTua,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Get.to(() => const Beranda());
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
                    20.heightBox,
                    "Atau"
                        .text
                        .center
                        .color(hijauTua)
                        .size(18)
                        .fontFamily(bold)
                        .make(),
                    20.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: hijauTua),
                        borderRadius: BorderRadius.circular(8),
                        color: putihTerang,
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(icGoogle, width: 24, height: 24),
                            const SizedBox(
                                width: 8), // Add space between image and text
                            const Text(
                              masukGoogle,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: bold,
                                color: hijauTua,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).box.width(context.screenWidth - 50).make(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
