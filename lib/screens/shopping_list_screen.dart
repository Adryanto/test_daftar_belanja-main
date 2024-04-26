import 'package:flutter/material.dart';
import 'package:test_daftar_belanja/services/shopping_services.dart';
import 'list_belanja_screen.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final ShoppingService _shoppingService = ShoppingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Belanja"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller1,
                    decoration:
                        const InputDecoration(hintText: 'Masukkan Nama'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Masukkan NPM'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding:
                EdgeInsets.only(bottom: 16.0), // Memberikan ruang di bawah FAB
            child: FloatingActionButton(
              onPressed: () {
                _shoppingService.addShoppingItem(
                    _controller1.text, _controller2.text, context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListBelanjaScreen()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.purple, // Ubah warna latar belakang FAB
              elevation: 4, // Berikan efek bayangan pada FAB
              splashColor:
                  Colors.white, // Ubah warna efek splash saat FAB ditekan
            ),
          ),
        ],
      ),
    );
  }
}
