import 'package:flutter/material.dart';

class OrderTracker extends StatelessWidget {
  final int currentStep;

  OrderTracker({required this.currentStep});

  final List<String> statuses = [
    "Pending",
    "Packed",
    "Delivering/Shipping",
    "Delivered"
  ];

  final List<String> dates = [
    "Wed, 11th Jan",
    "Wed, 11th Jan",
    "Wed, 13th Jan",
    "Expected by, Mon 16th"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Order Status",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          children: List.generate(statuses.length, (index) {
            bool isActive = index <= currentStep;
            return Expanded(
              child: Column(
                children: [
                  // Dot
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.blue : Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check,
                        color: Colors.white, size: 14),
                  ),

                  SizedBox(height: 8),

                  // Status label
                  Text(
                    statuses[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isActive ? Colors.black : Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // Date label
                  Text(
                    dates[index],
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }),
        ),

        // Connecting line
        Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 2,
                color: Colors.grey.shade300,
              ),
            ),
            FractionallySizedBox(
              widthFactor: currentStep / (statuses.length - 1),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 2,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}