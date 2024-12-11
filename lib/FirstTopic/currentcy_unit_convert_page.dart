import 'package:converter/FirstTopic/api_service.dart';
import 'package:converter/FirstTopic/currentcy_model.dart';
import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentcyUnitConvertPage extends StatefulWidget {
  const CurrentcyUnitConvertPage({super.key});

  @override
  State<CurrentcyUnitConvertPage> createState() => _CurrentcyUnitConvertPageState();
}

class _CurrentcyUnitConvertPageState extends State<CurrentcyUnitConvertPage> {
  final money = TextEditingController();
  String convertedMoney = 'Money';

  double rate = 0;

  void _convert() async {
    Map<String, dynamic> result = await ApiService.get();
    final Map<String, dynamic> jsonData = result;
    final exchangeRates = ExchangeRates.fromJson(jsonData);
    exchangeRates.data.forEach((key, value) {
      if (key == 'VND') {
        debugPrint('$key: ${value.code} - ${value.value}');
        setState(() {
          rate = value.value;
        });
      }
    });
  }

  void _vndToUsd() {
    if (rate != 0) {
      double m = double.parse(money.text);
      double converted = m / rate;
      setState(() {
        convertedMoney = converted.toStringAsFixed(2);
      });
    }
  }

  void _usdToVnd() {
    if (rate != 0) {
      double m = double.parse(money.text);
      double converted = m * rate;
      setState(() {
        convertedMoney = converted.toStringAsFixed(2);
      });
    }
  }

  @override
  void initState() {
    _convert();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Currentcy Unit Page",
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
          _commonTextField(controller: money, lable: "Nhập số tiền"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _commonButton(onPressed: _vndToUsd, lable: "VND -> USD"),
              const SizedBox(width: 20),
              _commonButton(onPressed: _usdToVnd, lable: "USD -> VND"),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 100,
            child: Text(
              convertedMoney,
              style: const TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            ),
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

  Widget _commonButton({required onPressed, required lable}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // backgroundColor: ,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
      child: Text(
        lable,
        style: const TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
