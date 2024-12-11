import 'package:converter/SecondTopic/set_color.cubit.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingColorPage extends StatefulWidget {
  const SettingColorPage({super.key});

  @override
  State<SettingColorPage> createState() => _SettingColorPageState();
}

class _SettingColorPageState extends State<SettingColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Setting Color Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: context.watch<SetColor>().state,
      body: Column(
        children: [
          ColorPicker(
            onColorChanged: (value) {
              // print(value.toString());
            },
            onColorChangeEnd: (value) {
              BlocProvider.of<SetColor>(context).changeSelectedColor(value);
            },
            pickersEnabled: const <ColorPickerType, bool>{
              ColorPickerType.both: false,
              ColorPickerType.primary: true,
              ColorPickerType.accent: true,
              ColorPickerType.bw: false,
              ColorPickerType.custom: true,
              ColorPickerType.wheel: true,
            },
            enableShadesSelection: true,
            includeIndex850: true,
            enableOpacity: true,
            actionButtons: const ColorPickerActionButtons(
              dialogCancelButtonLabel: 'Nope',
              dialogCancelButtonType: ColorPickerActionButtonType.outlined,
              dialogOkButtonLabel: 'Yes',
              dialogOkButtonType: ColorPickerActionButtonType.elevated,
            ),
          ),
        ],
      ),
    );
  }
}
