
import 'package:clean_arquitecture/ui/utils/routes.dart';
import 'package:flutter/material.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layer Suite Mobile',
      initialRoute: '/',
      routes: getAplicattionRoutes(),
      
    );
  }
}