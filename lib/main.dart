import 'package:converter/Root/dependency_injection.dart';
import 'package:converter/Root/nav_bar_cubit.dart';
import 'package:converter/Root/route_path.dart';
import 'package:converter/Root/routes.dart';
import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await configDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<NavBarCubit>()),
        BlocProvider(create: (context) => getIt.get<SetColor>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Converter App',
        routes: routes,
        initialRoute: RoutePath.root,
      ),
    );
  }
}
