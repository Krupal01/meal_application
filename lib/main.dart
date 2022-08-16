import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        MyHomePage.homePageRoute :(context) => const MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const homePageRoute = "/";
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

  final routeArg = ModalRoute.of(context)?.settings.arguments as String ;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArg.toString()),
      ),
      body: const Center(
        
      )
    );
  }
}
