import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final TextEditingController textEditingController;
  const Search({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hint: Text("Add product", style: TextStyle(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.deepPurple, width: 3),
        ),
      ),
      controller: textEditingController,
    );
  }
}
