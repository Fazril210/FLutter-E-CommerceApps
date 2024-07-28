import 'package:biu_merch/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int quantity = 1;
  String paymentMethod = 'Pilih metode pembayaran';
  List<String> paymentMethods = [
    'Pilih metode pembayaran',
    'Transfer Bank',
    'E-Wallet',
    'QRIS'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: putihTerang,
      child: Scaffold(
        appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: hijauTua),
        ),
        title: ringkasanpesanan.text.color(hijauTua).fontFamily(bold).make(),
        centerTitle: true,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomerInfoCard(),
              OrderSummary(
                quantity: quantity,
                onQuantityChanged: (newQuantity) {
                  setState(() {
                    quantity = newQuantity;
                  });
                },
              ),
              const AdditionalNotes(),
              const HeightBox(30),
              PaymentMethod(
                paymentMethod: paymentMethod,
                paymentMethods: paymentMethods,
                onPaymentMethodChanged: (newMethod) {
                  setState(() {
                    paymentMethod = newMethod;
                  });
                },
              ),
              TotalPrice(totalPrice: 22500 * quantity),
              const PayButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerInfoCard extends StatelessWidget {
  const CustomerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: putihTerang,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity, // Set width to full
              child: Text('Nama: Jhon Doe',
                  style: TextStyle(color: Color(0xFF0B4D3B), fontSize: 16)),
            ),  
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity, // Set width to full
              child: Text('No. telpon: 08123456789',
                  style: TextStyle(color: Color(0xFF0B4D3B), fontSize: 16)),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity, // Set width to full
              child: Text('Alamat : Univ Bina Insani',
                  style: TextStyle(color: Color(0xFF0B4D3B), fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const OrderSummary(
      {super.key, required this.quantity, required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: putihTerang,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imgAyamGeprek,
                  width: 100, height: 100, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ayam Geprek',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Text('Rp. 22.500',
                      style: TextStyle(color: Colors.green, fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 0) {
                            onQuantityChanged(quantity - 1);
                          }
                        },
                      ),
                      Text('$quantity', style: const TextStyle(fontSize: 16)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          onQuantityChanged(quantity + 1);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdditionalNotes extends StatelessWidget {
  const AdditionalNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: putihTerang,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Catatan Tambahan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan catatan tambahan di sini',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String paymentMethod;
  final List<String> paymentMethods;
  final ValueChanged<String> onPaymentMethodChanged;

  const PaymentMethod({
    super.key,
    required this.paymentMethod,
    required this.paymentMethods,
    required this.onPaymentMethodChanged,
  });
  

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xFF0B4D3B),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: paymentMethod,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            dropdownColor: const Color(0xFF0B4D3B),
            items: paymentMethods.map((String method) {
              return DropdownMenuItem<String>(
                value: method,
                child:
                    Text(method, style: const TextStyle(color: Colors.white, fontFamily: bold)),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                onPaymentMethodChanged(newValue);
              }
            },
          ).box.width(context.screenWidth - 20).make(),
        ),
      ).box.width(context.screenWidth - 20).make(),
    );
  }
}


class TotalPrice extends StatelessWidget {
  final int totalPrice;

  const TotalPrice({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
        locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Total Harga:', style: TextStyle(fontSize: 16)),
          Text(formatCurrency.format(totalPrice),
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class PayButton extends StatelessWidget {
  const PayButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
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
            bayarpesanan,
            style: TextStyle(
              fontSize: 25,
              fontFamily: extrabold,
              color: putihTerang,
            ),
          ),
        ).box.width(context.screenWidth - 20).make(),
      ),
    );
  }
}
