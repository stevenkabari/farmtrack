import 'package:farmtrack/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:farmtrack/auth.dart';
import 'package:farmtrack/pages/home_page.dart';
// import 'package:farmtrack/pages/login_register_page.dart';
class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const Welcome();
        }
      },
    );
  }
}