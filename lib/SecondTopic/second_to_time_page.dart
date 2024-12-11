import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondToTimePage extends StatefulWidget {
  const SecondToTimePage({super.key});

  @override
  State<SecondToTimePage> createState() => _SecondToTimePageState();
}

class _SecondToTimePageState extends State<SecondToTimePage> {
  final secondController = TextEditingController();

  String result = '';

  void convertToHoursMinutesSeconds() {
    int totalSeconds = int.parse(secondController.text);
    int hours = totalSeconds ~/ 3600; // Tính số giờ
    int remainingSeconds = totalSeconds % 3600; // Số giây còn lại sau khi trừ giờ
    int minutes = remainingSeconds ~/ 60; // Tính số phút
    int seconds = remainingSeconds % 60; // Số giây còn lại

    setState(() {
      result = '$hours:$minutes:$seconds';
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
          "Second To Time Page",
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
          _commonTextField(controller: secondController, lable: "Nhập vào số giây"),
          _commonButton(onPressed: convertToHoursMinutesSeconds, lable: "Đổi"),
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
