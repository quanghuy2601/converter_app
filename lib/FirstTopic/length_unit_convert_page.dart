import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/properties/length.dart';

class LengthUnitConvertPage extends StatefulWidget {
  const LengthUnitConvertPage({super.key});

  @override
  State<LengthUnitConvertPage> createState() => _LengthUnitConvertPageState();
}

class _LengthUnitConvertPageState extends State<LengthUnitConvertPage> {
  final length = TextEditingController();
  String convertedLength = 'length';

  void cmToInch() {
    var inch = 1.convertFromTo(LENGTH.centimeters, LENGTH.inches);
    var l = double.parse(length.text) * inch!;
    setState(() {
      convertedLength = l.toStringAsFixed(2);
    });
  }

  void inchToCm() {
    var cm = 1.convertFromTo(LENGTH.inches, LENGTH.centimeters);
    var l = double.parse(length.text) * cm!;
    setState(() {
      convertedLength = l.toStringAsFixed(2);
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
          "Length Unit Convert Page",
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
          _commonTextField(controller: length, lable: "Chiều dài"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _commonButton(onPressed: cmToInch, lable: "CM -> INCH"),
              const SizedBox(width: 20),
              _commonButton(onPressed: inchToCm, lable: "INCH -> CM"),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 100,
            child: Text(
              convertedLength,
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
