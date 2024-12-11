import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayMonthPage extends StatefulWidget {
  const DayMonthPage({super.key});

  @override
  State<DayMonthPage> createState() => _DayMonthPageState();
}

class _DayMonthPageState extends State<DayMonthPage> {
  final month = TextEditingController();

  String result = '';

  int year = DateTime.now().year;
  void daysInMonth() {
    int m = int.parse(month.text);
    if (m < 1 || m > 12) {
      setState(() {
        result = 'Không hợp lệ';
      });
      return;
    }
    if (m == 12) {
      int day = DateTime(year + 1, 1, 0).day;
      setState(() {
        result = "$day Ngày";
      });
    } else {
      int day = DateTime(year, m + 1, 0).day;
      setState(() {
        result = "$day Ngày";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Day Month Page",
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
          _commonTextField(controller: month, lable: "Nhập số tháng"),
          _commonButton(onPressed: daysInMonth, lable: "OK"),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 100,
            child: Text(
              result,
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
