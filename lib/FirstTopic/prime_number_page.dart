import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimeNumberPage extends StatefulWidget {
  const PrimeNumberPage({super.key});

  @override
  State<PrimeNumberPage> createState() => _PrimeNumberPageState();
}

class _PrimeNumberPageState extends State<PrimeNumberPage> {
  final listNumber = TextEditingController();
  String result = '';

  bool isPrime(int n) {
    if (n <= 1) {
      return false;
    }

    if (n == 2 || n == 3) {
      return true;
    }

    if (n % 2 == 0 || n % 3 == 0) {
      return false;
    }

    for (int i = 5; i * i <= n; i += 6) {
      if (n % i == 0 || n % (i + 2) == 0) {
        return false;
      }
    }

    return true;
  }

  void fintLargestPrime() {
    List<int> numbers = (listNumber.text).split(',').map(int.parse).toList();
    List<int> primes = numbers.where(isPrime).toList();
    if (primes.isEmpty) {
      setState(() {
        result = 'Không có số nguyên tố';
      });
    }
    setState(() {
      result = primes.reduce((a, b) => a > b ? a : b).toString();
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
          "Prime Number Page",
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
            onPressed: fintLargestPrime,
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
