
import 'package:clean_arquitecture/domain/entities/login_entity.dart';
import 'package:clean_arquitecture/domain/repository/storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token='TOKEN';
const _pref_username='USERNAME';
const _pref_profile='PROFILE';


class LocalStorageRepository implements StorageRepository{

  @override
  Future<void> clearAllData() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  Future getUser() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return null;
  }

  @override
  Future<void> saveUser(LoginEntity user) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_username, user.document);
    sharedPreferences.setInt(_pref_profile, user.profile);
  }

  @override
  Future<void> saveToken(String token) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
  }

}