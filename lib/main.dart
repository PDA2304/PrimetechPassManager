import 'package:flutter/material.dart';
import 'package:passmanager/routes.dart';

import 'constant/url.dart';

void main() {
  runApp(PassManager(
    router: AppRouter(),
  ));
}

class PassManager extends StatelessWidget {
  final AppRouter router;

  PassManager({Key? key, required this.router}) : super(key: key);

  bool isSingIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRouter,
      initialRoute: isSingIn ? home : singIn,
    );
  }
}
