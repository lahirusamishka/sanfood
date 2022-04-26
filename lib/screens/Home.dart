import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanfood'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  hintText: 'Enter Name',
                  filled: true,
                  fillColor: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                  hintText: 'Enter Amount',
                  filled: true,
                  fillColor: Colors.white),
            ),
            TextButton(
                onPressed: () => {saveData()}, child: const Text("Save")),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }

  void saveData() {
    String name = _nameController.text;
    String amount = _amountController.text;

    CollectionReference users = FirebaseFirestore.instance.collection('orders');

    users.add({
      'amount': amount,
      'date': 'asdasd',
      'name': name,
      'note': 'sd',
      'price': '123',
      'type': 'aasd'
    });
  }
}
