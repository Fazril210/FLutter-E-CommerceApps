import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:biu_merch/consts/consts.dart';
import 'package:biu_merch/views/beranda/beranda_screen.dart';
import 'package:biu_merch/views/controllers/beranda_controller.dart';
import 'package:biu_merch/views/kategori/kategori_screen.dart';
import 'package:biu_merch/views/keranjang/keranjang_screen.dart';
import 'package:biu_merch/views/profil/profil_screen.dart';

Widget coloredSvgIcon(String assetName, Color color, {double size = 26, double opacity = 1.0}) {
  return Opacity(
    opacity: opacity,
    child: SvgPicture.asset(
      assetName,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    ),
  );
}

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BerandaController());

    var navbarItem = [
      BottomNavigationBarItem(
        icon: coloredSvgIcon('assets/icon/navigation_bar/beranda.svg', abuabu, opacity: 0.5),
        activeIcon: coloredSvgIcon('assets/icon/navigation_bar/beranda.svg', Colors.black),
        label: beranda,
      ),
      BottomNavigationBarItem(
        icon: coloredSvgIcon('assets/icon/navigation_bar/kategori.svg', abuabu, opacity: 0.5),
        activeIcon: coloredSvgIcon('assets/icon/navigation_bar/kategori.svg', Colors.black),
        label: kategori,
      ),
      BottomNavigationBarItem(
        icon: coloredSvgIcon('assets/icon/navigation_bar/keranjang.svg', abuabu, opacity: 0.5),
        activeIcon: coloredSvgIcon('assets/icon/navigation_bar/keranjang.svg', Colors.black),
        label: keranjang,
      ),
      BottomNavigationBarItem(
        icon: coloredSvgIcon('assets/icon/navigation_bar/profil.svg', abuabu, opacity: 0.5),
        activeIcon: coloredSvgIcon('assets/icon/navigation_bar/profil.svg', Colors.black),
        label: profil,
      ),
    ];

    var navBody = [
      const BerandaScreen(),
      const KategoriScreen(),
      const KeranjangScreen(),
      const ProfilScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.black,
          unselectedItemColor: abuabu.withOpacity(0.5),
          selectedLabelStyle: const TextStyle(fontFamily: bold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: putihTerang,
          items: navbarItem,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
        )
      ),
    );
  }
}