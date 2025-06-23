import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final List<String> options = [
    'Pending',
    'Processing',
    'Shipped',
    'Delivered'
  ];

  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        hint: const Text('Select Status'),
        underline: const SizedBox(), // Removes the default underline
        icon: const Icon(Icons.arrow_drop_down),
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            value = newValue;
          });
        },
      ),
    );
  }
}
