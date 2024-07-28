import 'package:biu_merch/consts/consts.dart';
import 'package:biu_merch/views/keranjang/check_out.dart';
import 'package:biu_merch/widget_umum/tombol_beranda.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KeranjangScreenState createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  bool _showTotalPrice = false;
  List<int> quantities = List.generate(10, (index) => 0); // Track quantities
  int totalPrice = 0;

  void _updateTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < quantities.length; i++) {
      totalPrice += quantities[i] * 22500; // Price for each item
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: keranjangsaya.text.color(hijauTua).fontFamily(bold).make(),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              height: 0.5,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TombolBeranda(
                        width: context.screenWidth / 1.5,
                        height: context.screenHeight * 0.15,
                        icon: imgAyamGeprek,
                        title: ayamGeprek,
                        harga: "Rp. 22.500",
                        onCheckboxChanged: (value) {
                          setState(() {
                            _showTotalPrice = value!;
                            _updateTotalPrice();
                          });
                        },
                        onIncrease: () {
                          setState(() {
                            quantities[index]++;
                            _updateTotalPrice();
                          });
                        },
                        onDecrease: () {
                          setState(() {
                            if (quantities[index] > 0) {
                              quantities[index]--;
                              _updateTotalPrice();
                            }
                          });
                        },
                        quantity: quantities[index],
                      ),
                    ),
                  ),
                ),
              ),
              if (_showTotalPrice)
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Harga:",
                            style: TextStyle(
                              fontSize: 18,
                              color: abuabu,
                              fontFamily: bold,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp. ',
                              decimalDigits: 0,
                            ).format(totalPrice),
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: hijauTua,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Get.to(() => const CheckOut());
                            },
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const Text(
                              checkout,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: extrabold,
                                color: putihTerang,
                              ),
                            ),
                          ).box.width(context.screenWidth - 20).make(),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
