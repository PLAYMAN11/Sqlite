import 'package:flutter/material.dart';
import 'package:sqlito/widgets/home.dart';

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SQL ito",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.orangeAccent,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
