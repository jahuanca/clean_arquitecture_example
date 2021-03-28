
import 'package:clean_arquitecture/domain/repository/storage_repository.dart';

class SaveTokenUseCase{
  final StorageRepository _storageRepository;

  SaveTokenUseCase(this._storageRepository);

  Future<void> execute(String token) async{
    return await _storageRepository.saveToken(token);
  }
}