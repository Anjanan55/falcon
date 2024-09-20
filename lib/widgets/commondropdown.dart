import 'package:flutter/material.dart';

Widget commonDropDown(List<String> items, String selected, String label,
    ValueChanged<String?> onChange) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: const TextStyle(fontSize: 16), // Increase font size
        ),
      ),
      Container(
        // decoration: BoxDecoration(
        //     border: Border.all(
        //         color: const Color.fromARGB(255, 193, 187, 187), width: 1)),
        width: double.infinity, // Increase width of the dropdown
        padding: const EdgeInsets.symmetric(horizontal: 12.0), // Add padding
        child: DropdownButton<String>(
          isExpanded: true, // Make the dropdown take full width
          value: selected,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    fontSize: 18), // Increase font size of items
              ),
            );
          }).toList(),
          onChanged: onChange,
        ),
      ),
    ],
  );
}
