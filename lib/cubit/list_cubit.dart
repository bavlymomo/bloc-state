import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:bloc_tester/models/product_model.dart';
import 'package:equatable/equatable.dart';
part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListInitial());

  void addProduct(String label) {
    if (label.trim() != "") {
      Product product = Product(
        id: Random().nextInt(100),
        name: label,
        price: double.parse((Random().nextDouble() * 10000).toStringAsFixed(2)),
      );
      emit(ListUpdate([...state.products, product], state.isEditingId));
    }
  }

  void removeProduct(int id) {
    List<Product> updated = state.products.where((e) => e.id != id).toList();
    emit(ListUpdate(updated, state.isEditingId));
  }

  void editProduct(int id, String newName) {
    if (newName.isNotEmpty) {
      List<Product> upadted = state.products.map((e) {
        if (e.id == id) {
          return Product(id: e.id, name: newName, price: e.price);
        } else {
          return e;
        }
      }).toList();
      emit(ListUpdate(upadted, null));
    } else {
      emit(ListUpdate(state.products, id));
    }
  }
}
