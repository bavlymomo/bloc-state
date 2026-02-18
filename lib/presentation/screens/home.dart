import 'package:bloc_tester/cubit/list_cubit.dart';
import 'package:bloc_tester/models/product_model.dart';
import 'package:bloc_tester/presentation/widgets/button.dart';
import 'package:bloc_tester/presentation/widgets/product.dart';
import 'package:bloc_tester/presentation/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void handleAdd(String label) {
      context.read<ListCubit>().addProduct(label);
      _textEditingController.text = "";
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/about');
        },
        child: Text("About"),
      ),
      backgroundColor: Colors.tealAccent,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Search(textEditingController: _textEditingController),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ButtonAdd(
                    handleAdd: handleAdd,
                    textEditingController: _textEditingController,
                  ),
                ),
              ],
            ),

            BlocBuilder<ListCubit, ListState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: state.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product = state.products[index];
                      return ProductView(
                        product: product,
                        onDelete: () {
                          context.read<ListCubit>().removeProduct(product.id);
                        },
                        onEdit: (newName) {
                          context.read<ListCubit>().editProduct(
                            product.id,
                            newName,
                          );
                        },
                        isPressed: product.id == state.isEditingId,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
