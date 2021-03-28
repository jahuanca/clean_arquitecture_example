
import 'package:clean_arquitecture/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:clean_arquitecture/di/dependencies_provider.dart' as di;
 
void main() {
  di.init();

  runApp(App());
}

 
