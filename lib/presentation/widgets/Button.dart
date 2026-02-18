import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
  final Function(String) handleAdd;
  final TextEditingController textEditingController;
  const ButtonAdd({
    super.key,
    required this.handleAdd,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => handleAdd(textEditingController.text),
      child: Text("Add"),
    );
  }
}
