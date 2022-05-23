import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Testt extends StatefulWidget {
  const Testt({Key? key}) : super(key: key);

  @override
  State<Testt> createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  var db = FirebaseFirestore.instance;

  Future<void> readData() async {
    FlutterNativeSplash.remove();
    var uu = await db
        .collection("quizs")
        .doc('Knowing Our Numbers |')
        .collection('questions')
        .get()
        .then((value) {
      for (var doc in value.docs) {
        print(doc.data()['question']);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                readData();
              },
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
