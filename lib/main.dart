import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:testing/bloc/candidate/candidate_bloc.dart';
import 'package:testing/bloc/home/home_bloc.dart';
import 'package:testing/utils/routes_generate.dart';
import 'package:testing/views/layouts/main.layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<CandidateBloc>(
          create: (context) => CandidateBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Tech Test',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        builder: EasyLoading.init(),
        onGenerateRoute: RoutesGenerate.generateRoute,
        home: const MainLayout(),
      ),
    );
  }
}

