import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ShoppingService {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('shopping_list');

  Stream<Map<String, String>> getShoppingList() {
    return _database.onValue.map((event) {
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          items[key] =
              'Nama\t\t:${value['name']} \nnpm\t\t\t\t: ${value['npm']}';
        });
      }
      return items;
    });
  }

  void addShoppingItem(String nama, npm, BuildContext context) {
    if (nama.isEmpty || npm.isEmpty) {
      const warning = SnackBar(content: Text("Data yang diinput harus diisi"));
      ScaffoldMessenger.of(context).showSnackBar(warning);
    } else {
      _database.push().set({'name': nama, 'npm': npm});
    }
  }

  Future<void> removeShoppingItem(String key) async {
    await _database.child(key).remove();
  }
}
