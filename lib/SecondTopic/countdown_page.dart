import 'dart:async';

import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({super.key});

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  final hourController = TextEditingController();
  final minuteController = TextEditingController();
  final secondController = TextEditingController();

  String result = '';

  int hour = 0;
  int minute = 0;
  int second = 0;
  Timer? timer;

  void startTimer() {
    hour = int.parse(hourController.text);
    minute = int.parse(minuteController.text);
    second = int.parse(secondController.text);
    setState(() {
      result = '$hour:$minute:$second';
    });
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (second > 0) {
          setState(() {
            second--;
            result = '$hour:$minute:$second';
          });
        } else {
          setState(() {
            if (minute > 0) {
              setState(() {
                minute--;
                second = 59;
                result = '$hour:$minute:$second';
              });
            } else {
              if (hour > 0) {
                setState(() {
                  hour--;
                  minute = 59;
                  second = 59;
                  result = '$hour:$minute:$second';
                });
              }
            }
          });
        }
      },
    );
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Countdown Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: context.watch<SetColor>().state,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showTime(),
            _commonButton(onPressed: startTimer, lable: "Bắt đầu"),
            _commonButton(onPressed: stopTimer, lable: "Dừng"),
            _commonTextField(controller: hourController, lable: "Thời gian: giờ"),
            _commonTextField(controller: minuteController, lable: "Thời gian: phút"),
            _commonTextField(controller: secondController, lable: "Thời gian: giây"),
          ],
        ),
      ),
    );
  }

  Widget showTime() {
    return Text(
      result,
      style: const TextStyle(fontSize: 60),
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
    // final isRunning = timer == null ? false : timer!.isActive;

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
