import 'package:flutter/material.dart';
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/views/home.dart';
import 'package:quizmaker/views/signin.dart';

   void main() {
     runApp(MyApp());
   }

   class MyApp extends StatefulWidget {
     // This widget is the root of your application.
    @override
     _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

     bool _isLoggedIn = false;
      @override
      void initState() {
        checkUserLoggedInStatus();
       super.initState();
      }

      checkUserLoggedInStatus() async {
            HelperFunction.getUserLoggedInDetails().then((value) {
                 setState(() {
                   _isLoggedIn = value;
                 });
            });
  }


      @override
          Widget build(BuildContext context) {
               return MaterialApp(
                     title: 'Flutter Demo',
                     debugShowCheckedModeBanner: false,
                     theme: ThemeData(
                       primarySwatch: Colors.blue,
                       visualDensity: VisualDensity.adaptivePlatformDensity,
               ),
               home: (_isLoggedIn ?? true) ? Home() : SignIn(),
           );
       }
}
