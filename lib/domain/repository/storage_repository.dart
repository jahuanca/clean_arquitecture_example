
import 'package:clean_arquitecture/domain/entities/login_entity.dart';

abstract class StorageRepository{
  Future<String> getToken();
  Future<void> clearAllData();
  Future<void> saveUser(LoginEntity user);
  Future<void> saveToken(String token);
  Future<dynamic> getUser();
}