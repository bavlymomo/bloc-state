import 'package:bloc_tester/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final Product product;
  final Function() onDelete;
  final Function(String) onEdit;
  final bool isPressed;
  const ProductView({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
    required this.isPressed,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 23, 85, 192),
      ),
      child: ListTile(
        title: widget.isPressed
            ? TextField(
                decoration: InputDecoration(
                  hint: Text(
                    "New name",
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
                controller: _textEditingController,
              )
            : Text(widget.product.name, style: TextStyle(color: Colors.white)),
        subtitle: Text(
          '${widget.product.price}',
          style: TextStyle(color: Colors.white),
        ),
        trailing: widget.isPressed
            ? FilledButton(
                onPressed: () {
                  widget.onEdit(_textEditingController.text);
                  _textEditingController.clear();
                },
                child: Text("Done"),
              )
            : Wrap(
                spacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () => widget.onDelete(),
                    child: Text('Delete'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onEdit("");
                    },
                    child: Text('Edit'),
                  ),
                ],
              ),
      ),
    );
  }
}
