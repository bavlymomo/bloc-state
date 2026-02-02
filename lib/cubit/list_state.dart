part of 'list_cubit.dart';


sealed class ListState {
  List<Product> products;
  ListState(this.products);
}

final class ListInitial extends ListState {
  ListInitial() : super([]);
}

final  class ListUpdate extends ListState {
  ListUpdate(super.products);

}
