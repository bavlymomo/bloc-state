import 'package:bloc_tester/cubit/list_cubit.dart';
import 'package:bloc_tester/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  final Product product;
  final Function() onDelete;
  const ProductView({super.key, required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 23, 85, 192),
      ),

      child: ListTile(
        title: Text(product.name, style: TextStyle(color: Colors.white)),
        subtitle: Text(
          '${product.price}',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            ElevatedButton(onPressed: () => onDelete(), child: Text('Delete')),
            ElevatedButton(onPressed: () {}, child: Text('Edit')),
          ],
        ),
      ),
    );
  }
}
