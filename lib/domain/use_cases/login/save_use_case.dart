
import 'package:clean_arquitecture/domain/repository/storage_repository.dart';

class SaveUseCase{
  final StorageRepository _storageRepository;

  SaveUseCase(this._storageRepository);

  Future<void> execute(dynamic user) async{
    return await _storageRepository.saveUser(user);
  }
}