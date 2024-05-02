import 'package:bloc_cubits_tutorial/cubits/internet_cubits/internet_cubit.dart';
import 'package:bloc_cubits_tutorial/cubits/internet_cubits/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Connected!"),
              backgroundColor: Colors.green,
            ));
          } else if (state is InternetLostState) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Not Connected!"),
                backgroundColor: Colors.red,
              ));
            }
          }
        },
        builder: (context, state) {
          if (state is InternetGainedState) {
            return Text("Connected!");
          } else if (state is InternetLostState) {
            return Text("Not Connected!");
          } else {
            return Text("Loading...");
          }
        },
      )),
    );
  }
}
