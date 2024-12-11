import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetColor extends Cubit<Color> {
  SetColor() : super(Colors.white);

  changeSelectedColor(newColor) => emit(newColor);
}
