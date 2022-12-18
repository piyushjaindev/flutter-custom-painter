import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jploft_assignment/blocs/current_time/current_time_cubit.dart';
import 'package:jploft_assignment/blocs/juggle_counter/juggle_counter_cubit.dart';
import 'package:jploft_assignment/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => JuggleCounterCubit()),
        BlocProvider(lazy: false, create: (context) => CurrentTimeCubit()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
