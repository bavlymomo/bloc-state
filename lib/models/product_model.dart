import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  String name;
  double price;

  Product({required this.id, required this.name, required this.price});

  @override
  List<Object?> get props => [id, name, price];

  // Factory Product.fromJson(Map){

  // }
}
