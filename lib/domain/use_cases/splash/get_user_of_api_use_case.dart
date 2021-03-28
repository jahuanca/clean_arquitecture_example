
import 'package:clean_arquitecture/domain/repository/auth_repository.dart';

class GetUserOfAPIUseCase{
  final AuthRepository _authRepository;

  GetUserOfAPIUseCase(this._authRepository);

  Future<bool> execute(String token) async {
    return await _authRepository.getUserFromToken(token);
  }
}