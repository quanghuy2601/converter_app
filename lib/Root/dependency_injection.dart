import 'package:converter/Root/nav_bar_cubit.dart';
import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> configDependencies() async {
  getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());
  getIt.registerLazySingleton<SetColor>(() => SetColor());
}
