import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  final int currentStep;

  OrderStatusWidget({super.key, required this.currentStep});

  final List<String> steps = [
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
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length, (index) {
            return Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: index <= currentStep
                        ? Colors.blue
                        : Colors.grey.shade300,
                    child: Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    steps[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: index <= currentStep
                          ? Colors.black
                          : Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2),
                  Text(
                    dates[index],
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        SizedBox(height: 20),
        Divider(),
      ],
    );
  }
}
