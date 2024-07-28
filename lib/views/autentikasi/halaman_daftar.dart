import 'dart:ui';

import 'package:biu_merch/consts/consts.dart';
import 'package:biu_merch/views/controllers/auth_controller.dart';
import 'package:biu_merch/widget_umum/bg_widget_login.dart';
import 'package:biu_merch/widget_umum/bidang_teks_khusus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HalamanDaftar extends StatefulWidget {
  const HalamanDaftar({super.key});

  @override
  State<HalamanDaftar> createState() => _HalamanDaftarState();
}

class _HalamanDaftarState extends State<HalamanDaftar> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    var emailController = TextEditingController();
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
    var konfirmasipasswordController = TextEditingController();

    return bgWidgetLogin(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
              // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 250,
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
                    stops: const [0.3, 0.5, 0.7, 0.9],
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
                child: SingleChildScrollView( // Menambahkan SingleChildScrollView
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      // Judul
                      register.text
                          .fontFamily(extrabold)
                          .color(hijauTua)
                          .center
                          .size(40)
                          .make(),
                      register2.text
                          .fontFamily(extrabold)
                          .color(hijauTua)
                          .center
                          .size(40)
                          .make(),
                      const SizedBox(height: 10),
                      register3.text
                          .fontFamily(bold)
                          .color(textAbu)
                          .center
                          .size(20)
                          .make(),
                      register4.text
                          .fontFamily(bold)
                          .color(textAbu)
                          .center
                          .size(20)
                          .make(),
                      const SizedBox(height: 30),

                      // Text Field
                      bidangTeksKhusus(
                        hint: emailHint,
                        title: email,
                        isPass: false,
                        controller: emailController,
                      ),
                      const SizedBox(height: 10),

                      bidangTeksKhusus(
                        hint: usernameHint,
                        title: username,
                        isPass: true,
                        controller: usernameController,
                      ),
                      const SizedBox(height: 10),

                      bidangTeksKhusus(
                        hint: passwordHint,
                        title: password,
                        isPass: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 10),

                      bidangTeksKhusus(
                        hint: konfirmasiPassword,
                        title: konfirmasiPassword,
                        isPass: true,
                        controller: konfirmasipasswordController,
                      ),
                      const SizedBox(height: 80),

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
                                  controller.isloading(true);
                                },
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: const Text(
                                  daftar,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: bold,
                                    color: putihTerang,
                                  ),
                                ),
                              ),
                            ).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      "Atau"
                          .text
                          .center
                          .color(hijauTua)
                          .size(18)
                          .fontFamily(bold)
                          .make(),
                      10.heightBox,
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
                              Image.asset(icGoogle, width: 24, height: 24,),
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
      ),
    );
  }
}
