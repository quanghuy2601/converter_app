import 'package:converter/Root/route_path.dart';
import 'package:flutter/material.dart';

class FirstDashBoardPage extends StatelessWidget {
  const FirstDashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        children: [
          _commonButton(context, path: RoutePath.trang1Bai1, title: "Bài 1"),
          _commonButton(context, path: RoutePath.trang1Bai2, title: "Bài 2"),
          _commonButton(context, path: RoutePath.trang1Bai3, title: "Bài 3"),
          _commonButton(context, path: RoutePath.trang1Bai4, title: "Bài 4"),
          _commonButton(context, path: RoutePath.trang1Bai5, title: "Bài 5"),
          _commonButton(context, path: RoutePath.trang1Bai6, title: "Bài 6"),
          _commonButton(context, path: RoutePath.trang1Bai7, title: "Bài 7"),
        ],
      ),
    );
  }

  Widget _commonButton(BuildContext context, {required path, required title}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, path);
      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.black),
          ),
        ),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        direction: Axis.vertical,
        children: [
          const Icon(
            Icons.settings,
            size: 35,
            color: Colors.blueAccent,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
