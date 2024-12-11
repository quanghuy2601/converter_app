import 'dart:async';

import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  String result = '';
  int hour = 0;
  int minute = 0;
  int second = 0;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (second >= 60) {
          setState(() {
            second = 0;
            if (minute >= 60) {
              minute = 0;
              hour++;
            } else {
              minute++;
            }
          });
        } else {
          setState(() {
            second++;
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
          "Stop Watch Page",
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
          showTime(),
          _commonButton(onPressed: startTimer, lable: "Bắt đầu"),
          _commonButton(onPressed: stopTimer, lable: "Dừng"),
        ],
      ),
    );
  }

  Widget showTime() {
    return Text(
      '$second',
      style: const TextStyle(fontSize: 60),
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
