import 'package:clean_arquitecture/domain/repository/storage_repository.dart';

class GetTokenUseCase{
  final StorageRepository _storageRepository;

  GetTokenUseCase(this._storageRepository);

  Future<String> execute() async{
    print('buscando token...');
    return await _storageRepository.getToken();
  }

}