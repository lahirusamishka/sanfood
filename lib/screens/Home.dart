import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sanfood'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  hintText: 'Enter Name',
                  filled: true,
                  fillColor: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                  hintText: 'Enter Amount',
                  filled: true,
                  fillColor: Colors.white),
            ),
            TextButton(
                onPressed: () => {saveData()}, child: const Text("Save")),
          ],
        ),
      ),
    );
  }

  void saveData() {
    String name = _nameController.text;
    String amount = _amountController.text;

    CollectionReference users = FirebaseFirestore.instance.collection('orders');

    users.add({
      'amount': 'asdasd',
      'date': 'asdasd',
      'name': 'ssadasdasd',
      'note': 'sd',
      'price': '123',
      'type': 'aasd'
    });
  }
}
