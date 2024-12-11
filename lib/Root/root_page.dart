import 'package:converter/FirstTopic/first_dash_board_page.dart';
import 'package:converter/Root/nav_bar_cubit.dart';
import 'package:converter/SecondTopic/second_dash_board_page.dart';
import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Widget> pages = [
    const FirstDashBoardPage(),
    const SecondDashBoardPage(),
  ];

  void onPageChanged(int page) {
    BlocProvider.of<NavBarCubit>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavBar(context),
      backgroundColor: context.watch<SetColor>().state,
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        'Converter',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
    );
  }

  PageView _body() {
    return PageView(
      onPageChanged: (int page) => onPageChanged(page),
      controller: pageController,
      children: pages,
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 65,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _bottomNavbaritem(
              context,
              defaultIcon: const Icon(Icons.school, color: Colors.grey),
              choosenIcon: const Icon(Icons.school, color: Colors.blueAccent),
              page: 0,
              topic: "Chủ đề 1",
            ),
            _bottomNavbaritem(
              context,
              defaultIcon: const Icon(Icons.school, color: Colors.grey),
              choosenIcon: const Icon(Icons.school, color: Colors.blueAccent),
              page: 1,
              topic: "Chủ đề 2",
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavbaritem(BuildContext context, {required defaultIcon, required choosenIcon, required page, required topic}) {
    int currentPage = context.watch<NavBarCubit>().state;
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NavBarCubit>(context).changeSelectedIndex(page);
        pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 10),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            const SizedBox(height: 5),
            (currentPage == page) ? choosenIcon : defaultIcon,
            const SizedBox(height: 5),
            Text(
              topic,
              style: TextStyle(
                color: (currentPage == page) ? Colors.blueAccent : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
