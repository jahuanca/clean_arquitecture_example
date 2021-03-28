
import 'package:clean_arquitecture/domain/entities/login_entity.dart';

class LoginRequest extends LoginEntity{
  LoginRequest({this.profile, this.document, this.password});

  
  int profile;
  String document;
  String password;
    
  Map<String, dynamic> toJson() => {
    "profile" : profile,
    "document" : document,
    "password" : password
  };

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
      profile: json["profile"],
      document: json["document"],
      password: json["password"]
  );

}