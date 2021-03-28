
import 'package:clean_arquitecture/domain/entities/login_entity.dart';
import 'package:clean_arquitecture/domain/entities/status_entity.dart';
import 'package:clean_arquitecture/domain/repository/auth_repository.dart';

class SignInUseCase{
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<StatusEntity> execute(LoginEntity loginEntity) async{
    return await _authRepository.login(loginEntity);
  }
}