import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/bloc/set_data/set_data_cubit.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.black,
        activeTrackColor: Colors.amber,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.blue,
        value: BlocProvider.of<SetDataCubit>(context).getTheme() ?? false,
        onChanged: (value) async {
          await BlocProvider.of<SetDataCubit>(context).setTheme(value: value);
          setState(() {});
        });
  }
}
