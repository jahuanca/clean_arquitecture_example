

import 'package:clean_arquitecture/core/colors.dart';
import 'package:clean_arquitecture/core/strings.dart';
import 'package:clean_arquitecture/di/dependencies_provider.dart';
import 'package:clean_arquitecture/ui/pages/splash/bloc/splash_bloc.dart';
import 'package:clean_arquitecture/ui/pages/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';



class SplashPage extends StatelessWidget {
  final SplashBloc _bloc;

  SplashPage() : _bloc= getIt<SplashBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: StreamBuilder<SplashState>(
             stream: _bloc.observableState,
             initialData: _bloc.state,
             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               final state = snapshot.data;
               if(snapshot.hasData){
                  if(state is LoadedWithOutAuth){
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pushReplacementNamed('login');
                    }); 
                  }
                  if(state is LoadedWithAuth){
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pushReplacementNamed('home');
                    }); 
                  }
                  return Container(
                    child: Image.asset('${rImages}img_layer_logo.png')
                  );
               }else{
                 return Container();
               }
             },
          )
        ),
      ),
    );

  }
}