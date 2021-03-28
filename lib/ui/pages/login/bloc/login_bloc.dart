
import 'dart:async';

import 'package:clean_arquitecture/core/bloc/bloc.dart';
import 'package:clean_arquitecture/domain/entities/login_entity.dart';
import 'package:clean_arquitecture/domain/entities/status_entity.dart';
import 'package:clean_arquitecture/domain/use_cases/login/save_token_case.dart';
import 'package:clean_arquitecture/domain/use_cases/login/sign_in_use_case.dart';
import 'package:clean_arquitecture/ui/pages/login/bloc/login_state.dart';
import 'package:flutter/cupertino.dart';

class LoginBloc extends Bloc<LoginState>{
  
  final SignInUseCase _signInUseCase;
  final SaveTokenUseCase _saveTokenUseCase;

  LoginBloc(this._signInUseCase, this._saveTokenUseCase){
    changeState(LoginUninitialized());
    _loginEntity.document='20454300654';
    _loginEntity.password='32799978???';
    _loginEntity.profile=91;

    passwordController.text=_loginEntity.password;
    userController.text=_loginEntity.document;
    perfilController.text=_loginEntity.profile.toString();

  }

  LoginEntity _loginEntity=new LoginEntity();
  final passwordController=new TextEditingController();
  final userController=new TextEditingController();
  final perfilController=new TextEditingController();


  void onLogin() async{
    
    _loginEntity.document=userController.text;
    _loginEntity.password=passwordController.text;
    _loginEntity.profile=[null, ''].contains(perfilController.text) ? 0 : int.parse(perfilController.text);

    print('consultando...');
    StatusEntity statusEntity=await _signInUseCase.execute(_loginEntity);
    if(statusEntity.success){
      await _saveTokenUseCase.execute('1234');
      print('token guardado');
      changeState(LoginAuthenticated());
    }else{
      changeState(LoginUnauthenticated());
    }
    Future.delayed(Duration(seconds: 1), (){
      changeState(LoginUninitialized());
    });
  }

}