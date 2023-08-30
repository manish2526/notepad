import 'package:flutter/material.dart';

import 'package:notepad/src/res/strings.dart';
import 'package:notepad/src/views/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: AppString.appname,
      theme: ThemeData(useMaterial3: true),
      home: HomeView(),
    );
  }
}




