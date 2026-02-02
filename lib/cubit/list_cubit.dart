import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_tester/models/product_model.dart';
import 'package:meta/meta.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListInitial());

  void addProduct(String label) {
    Product product = Product(
      id: Random().nextInt(100),
      name: label,
      price: double.parse((Random().nextDouble() * 10000).toStringAsFixed(2)),
    );
    emit(ListUpdate([...state.products, product]));
  }

  void removeProduct(int id) {
    emit(ListUpdate(state.products.where((e) => e.id != id).toList()));
  }
}
