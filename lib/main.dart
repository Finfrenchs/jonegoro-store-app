import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jonegoro_store_app/bloc/register/register_bloc.dart';
import 'package:jonegoro_store_app/pages/auth/auth_page.dart';
import 'package:jonegoro_store_app/pages/splash/splash_page.dart';
import 'package:jonegoro_store_app/utils/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: light,
        home: const AuthPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
