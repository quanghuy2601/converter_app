import 'dart:math';

import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SquareNumberPage extends StatefulWidget {
  const SquareNumberPage({super.key});

  @override
  State<SquareNumberPage> createState() => _SquareNumberPageState();
}

class _SquareNumberPageState extends State<SquareNumberPage> {
  final listNumber = TextEditingController();
  String result = '';

  bool isSquare(int n) {
    if (n < 0) return false;
    int sqrtValue = sqrt(n).toInt();
    return sqrtValue * sqrtValue == n;
  }

  void fintLargestSquare() {
    List<int> numbers = (listNumber.text).split(',').map(int.parse).toList();
    List<int> squares = numbers.where(isSquare).toList();
    if (squares.isEmpty) {
      setState(() {
        result = 'Không có số chính phương';
      });
    }
    setState(() {
      result = squares.reduce((a, b) => a > b ? a : b).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Square Number Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: context.watch<SetColor>().state,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _commonTextField(controller: listNumber, lable: "Nhập dãy số"),
          ElevatedButton(
            onPressed: fintLargestSquare,
            child: const Text("Kiểm tra"),
          ),
          const SizedBox(height: 10),
          Text(
            result,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }

  Widget _commonTextField({required controller, required lable}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.blueAccent,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: lable,
              labelStyle: const TextStyle(color: Colors.blueAccent),
            ),
          ),
        ),
      ),
    );
  }
}
