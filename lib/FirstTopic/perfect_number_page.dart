import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfectNumberPage extends StatefulWidget {
  const PerfectNumberPage({super.key});

  @override
  State<PerfectNumberPage> createState() => _PerfectNumberPageState();
}

class _PerfectNumberPageState extends State<PerfectNumberPage> {
  final listNumber = TextEditingController();
  String result = '';

  bool isPerfectNumber(int n) {
    if (n <= 1) return false;

    int sumOfDivisors = 0;
    for (int i = 1; i <= n ~/ 2; i++) {
      if (n % i == 0) {
        sumOfDivisors += i;
      }
    }

    return sumOfDivisors == n;
  }

  void fintLargestPerfectNumber() {
    List<int> numbers = (listNumber.text).split(',').map(int.parse).toList();
    List<int> perfectNumbers = numbers.where(isPerfectNumber).toList();
    if (perfectNumbers.isEmpty) {
      setState(() {
        result = 'Không có số hoàn hảo';
      });
    }
    setState(() {
      result = perfectNumbers.reduce((a, b) => a > b ? a : b).toString();
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
          "Perfect Number Page",
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
            onPressed: fintLargestPerfectNumber,
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
