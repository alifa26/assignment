import 'package:assignment/constants.dart';
import 'package:assignment/home.dart';
import 'package:assignment/shared/cacheHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cubits/timer cubit/app cubit/app_cubit.dart';

class Welcome extends StatefulWidget {
  
  const Welcome({ Key? key }) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('HI',
            style: TextStyle(
              fontSize: 50,
              color: Colors.red
            ),),
            TextButton(onPressed: (){DateTime now = DateTime.now();
                          String formattedDate = DateFormat('kk:mm EEE d MMM').format(now);
               FirebaseMessaging.instance.getToken().then((value) {
  String? token = value;
  AppBloc.get(context).getQuestions();
  FirebaseFirestore.instance.collection('temps').doc(token).set({
    'date': now,
      'token': '0',
  });
  navigateAndFinish(context, Home(score: 0,));
  
});
            },
             child: Text('Lets Play'))
          ],
        ),
      ),
    );
  }
}