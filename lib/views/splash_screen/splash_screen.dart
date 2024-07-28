
import 'package:biu_merch/widget_umum/bg_widget_login.dart';
import 'package:biu_merch/widget_umum/logoaplikasi_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const WelcomeScreen());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return bgWidgetLogin(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoaplikasiWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
