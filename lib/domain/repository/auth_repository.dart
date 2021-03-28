import 'package:clean_arquitecture/domain/entities/login_entity.dart';
import 'package:clean_arquitecture/domain/entities/status_entity.dart';

abstract class AuthRepository {
  Future<bool> getUserFromToken(String token);

  Future<StatusEntity> login(LoginEntity loginRequest);
}