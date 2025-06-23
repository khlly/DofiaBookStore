import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select Status',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      value: null,
      items: [
        DropdownMenuItem(value: 'pending', child: Text('Pending')),
        DropdownMenuItem(value: 'processing', child: Text('Processing')),
        DropdownMenuItem(value: 'shipped', child: Text('Shipped')),
        DropdownMenuItem(value: 'delivered', child: Text('Delivered')),
      ],
      onChanged: (value) {
        // Handle dropdown value change
      },
    );
  }
}
