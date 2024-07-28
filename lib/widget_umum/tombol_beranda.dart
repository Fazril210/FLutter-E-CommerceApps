import 'package:biu_merch/consts/consts.dart';
import 'package:flutter/material.dart';

class TombolBeranda extends StatefulWidget {
  final double width;
  final double height;
  final String icon;
  final String? title;
  final String? harga;
  final ValueChanged<bool?>? onCheckboxChanged;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final int quantity;

  const TombolBeranda({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    this.title,
    this.onCheckboxChanged,
    required this.onIncrease,
    required this.onDecrease,
    this.quantity = 0,
    this.harga,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TombolBerandaState createState() => _TombolBerandaState();
}

class _TombolBerandaState extends State<TombolBeranda> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: putih,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left side with image and title
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                        child: Image.asset(
                          widget.icon,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title ?? '',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontFamily: extrabold,
                                    fontSize: 25,
                                    color: warnaText,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.harga ?? '',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontFamily: extrabold,
                                    fontSize: 18,
                                    color: hijauMuda,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Quantity controls and text in the bottom right corner
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: widget.onDecrease,
                      icon: const Icon(Icons.remove, color: Colors.grey),
                      iconSize: 17,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.quantity.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: abuabu,
                    fontFamily: bold,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: widget.onIncrease,
                      icon: const Icon(Icons.add, color: Colors.grey),
                      iconSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Checkbox in the top right corner
          Positioned(
            top: 10,
            right: 10,
            child: Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
                if (widget.onCheckboxChanged != null) {
                  widget.onCheckboxChanged!(value);
                }
              },
              checkColor: Colors.white,
              activeColor: hijauCheckBox,
            ),
          ),
        ],
      ),
    );
  }
}
