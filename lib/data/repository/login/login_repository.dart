
import 'dart:math';

import 'package:clean_arquitecture/data/http_manager/app_http_manager.dart';
import 'package:clean_arquitecture/data/request/login_request.dart';
import 'package:clean_arquitecture/domain/entities/login_entity.dart';
import 'package:clean_arquitecture/domain/entities/status_entity.dart';
import 'package:clean_arquitecture/domain/repository/auth_repository.dart';

class LoginRepository implements AuthRepository{
  @override
  Future<bool> getUserFromToken(String token) async{
    final r=new Random();
    return r.nextBool();
  }
  
  @override
  Future<StatusEntity> login(LoginEntity loginEntity) async{
    
    LoginRequest loginRequest=LoginRequest.fromJson(loginEntity.toJson());
    final AppHttpManager http=AppHttpManager();
    final res=await http.post(url: 'login', body: loginRequest.toJson(), headers: {});
    return (StatusEntity.fromJson(res));
  }

}