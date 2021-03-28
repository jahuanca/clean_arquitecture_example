import 'package:clean_arquitecture/core/bloc/bloc_provider.dart';
import 'package:clean_arquitecture/di/dependencies_provider.dart';
import 'package:clean_arquitecture/ui/pages/home/home_page.dart';
import 'package:clean_arquitecture/ui/pages/splash/bloc/splash_bloc.dart';
import 'package:clean_arquitecture/ui/pages/login/bloc/login_bloc.dart';
import 'package:clean_arquitecture/ui/pages/splash/splash_page.dart';
import 'package:clean_arquitecture/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
Map<String, Widget Function(BuildContext)> getAplicattionRoutes(){
  return {
    '/' : (BuildContext context) => (BlocProvider( bloc: getIt<SplashBloc>(), child: SplashPage(),)),
    /* '/' : (BuildContext context) => ( SplashPage()), */
    'login' : (BuildContext context) => (BlocProvider( bloc: getIt<LoginBloc>(), child: LoginPage(),)),
    'home' : (BuildContext context) => (HomePage()),
   };
}