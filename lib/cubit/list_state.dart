part of 'list_cubit.dart';

sealed class ListState  {
  List<Product> products;
  int? isEditingId;

  ListState(this.products ,this.isEditingId);
 
}

final class ListInitial extends ListState {
  ListInitial() : super([] , null);
}

final class ListUpdate extends ListState {
  ListUpdate(super.products , super.isEditingId);
}
