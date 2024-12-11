import 'package:converter/FirstTopic/basic_form_page.dart';
import 'package:converter/FirstTopic/currentcy_unit_convert_page.dart';
import 'package:converter/FirstTopic/day_month_page.dart';
import 'package:converter/FirstTopic/length_unit_convert_page.dart';
import 'package:converter/FirstTopic/perfect_number_page.dart';
import 'package:converter/FirstTopic/prime_number_page.dart';
import 'package:converter/FirstTopic/square_number_page.dart';
import 'package:converter/Root/root_page.dart';
import 'package:converter/SecondTopic/choose_image_page.dart';
import 'package:converter/SecondTopic/countdown_page.dart';
import 'package:converter/SecondTopic/second_to_time_page.dart';
import 'package:converter/SecondTopic/setting_color_page.dart';
import 'package:converter/SecondTopic/stopwatch_page.dart';
import 'package:converter/SecondTopic/time_to_second_page.dart';
import 'package:flutter/material.dart';
import 'package:converter/FirstTopic/first_dash_board_page.dart';
import 'package:converter/SecondTopic/second_dash_board_page.dart';
import 'package:converter/Root/route_path.dart';

Map<String, WidgetBuilder> routes = {
  RoutePath.root: (context) => const RootPage(),
  RoutePath.firstDashBoard: (context) => const FirstDashBoardPage(),
  RoutePath.secondDashBoarder: (context) => const SecondDashBoardPage(),
  //
  RoutePath.trang1Bai1: (context) => const BasicFormPage(),
  RoutePath.trang1Bai2: (context) => const LengthUnitConvertPage(),
  RoutePath.trang1Bai3: (context) => const CurrentcyUnitConvertPage(),
  RoutePath.trang1Bai4: (context) => const DayMonthPage(),
  RoutePath.trang1Bai5: (context) => const PrimeNumberPage(),
  RoutePath.trang1Bai6: (context) => const SquareNumberPage(),
  RoutePath.trang1Bai7: (context) => const PerfectNumberPage(),
  //
  RoutePath.trang2Bai1: (context) => const ChooseImagePage(),
  RoutePath.trang2Bai2: (context) => const CountdownPage(),
  RoutePath.trang2Bai3: (context) => const StopwatchPage(),
  RoutePath.trang2Bai4: (context) => const TimeToSecondPage(),
  RoutePath.trang2Bai5: (context) => const SecondToTimePage(),
  RoutePath.trang2Bai6: (context) => const SettingColorPage(),
};
