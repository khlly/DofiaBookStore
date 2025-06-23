import 'package:flutter/material.dart';

class CardDetailWidget extends StatelessWidget {
  final String title;
  final double subTotal;
  final double discount;
  final double tax;
  final double total;

  const CardDetailWidget({
    Key? key,
    required this.title,
    required this.subTotal,
    required this.discount,
    required this.tax,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            _row('Sub-total', subTotal),
            _row('Discount', -discount),
            _row('Tax', tax),
            Divider(),
            _row('Total', total, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, double value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
          Text(
            (value < 0 ? '- ' : '') + '\$${value.abs().toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
              color: isTotal ? Colors.blueAccent : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
