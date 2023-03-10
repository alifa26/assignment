import 'package:assignment/constants.dart';
import 'package:assignment/home.dart';
import 'package:assignment/shared/cacheHelper.dart';
import 'package:assignment/sign%20in/logi_screen.dart';
import 'package:assignment/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubits/timer cubit/app cubit/app_cubit.dart';
import 'cubits/timer cubit/app cubit/app_states.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.instance.getToken().then((value) {
  String? token = value;
  print('token issssss ${value}');
  
});

  userConst = FirebaseAuth.instance.currentUser;

  runApp(MyApp(
    user: userConst,
  ));
}

class MyApp extends StatelessWidget {
  User? user;

  MyApp({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppBloc(),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: background,
              primarySwatch: Colors.teal,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle : SystemUiOverlayStyle(
                  statusBarColor:Colors.teal,
                  statusBarIconBrightness: Brightness.light
                )
              )
            ),
            home: user != null ?  Welcome() :  LoginScreen(),
          );
        },
      ),
    );
  }
}
