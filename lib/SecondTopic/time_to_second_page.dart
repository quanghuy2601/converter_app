import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeToSecondPage extends StatefulWidget {
  const TimeToSecondPage({super.key});

  @override
  State<TimeToSecondPage> createState() => _TimeToSecondPageState();
}

class _TimeToSecondPageState extends State<TimeToSecondPage> {
  final hourController = TextEditingController();
  final minuteController = TextEditingController();
  final secondController = TextEditingController();

  String result = '';

  void convertToSeconds() {
    int hours = int.parse(hourController.text);
    int minutes = int.parse(minuteController.text);
    int seconds = int.parse(secondController.text);
    int totalSecond = (hours * 3600) + (minutes * 60) + seconds;
    setState(() {
      result = '$totalSecond giây';
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
          "Time To Second Page",
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
          _commonTextField(controller: hourController, lable: "Giờ"),
          _commonTextField(controller: minuteController, lable: "Phút"),
          _commonTextField(controller: secondController, lable: "Giây"),
          _commonButton(onPressed: convertToSeconds, lable: "Đổi"),
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
