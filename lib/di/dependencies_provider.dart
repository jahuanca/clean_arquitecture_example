


import 'package:clean_arquitecture/data/repository/login/login_repository.dart';
import 'package:clean_arquitecture/data/repository/storage/local_storage_repository.dart';
import 'package:clean_arquitecture/domain/repository/auth_repository.dart';
import 'package:clean_arquitecture/domain/repository/storage_repository.dart';
import 'package:clean_arquitecture/domain/use_cases/login/save_token_case.dart';
import 'package:clean_arquitecture/domain/use_cases/login/sign_in_use_case.dart';
import 'package:clean_arquitecture/domain/use_cases/splash/get_token_use_case.dart';
import 'package:clean_arquitecture/domain/use_cases/splash/get_user_of_api_use_case.dart';
import 'package:clean_arquitecture/ui/pages/login/bloc/login_bloc.dart';
import 'package:clean_arquitecture/ui/pages/splash/bloc/splash_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  registerSplashDependencies();
  registerLoginDependencies();
  
}

void registerSplashDependencies() {
  getIt.registerFactory(() => SplashBloc(getIt(), getIt()));

  getIt.registerLazySingleton(() => GetUserOfAPIUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTokenUseCase(getIt()));

  getIt.registerLazySingleton<StorageRepository>(() => LocalStorageRepository());
  
}

void registerLoginDependencies() {
  getIt.registerFactory(() => LoginBloc(getIt(), getIt()));

  getIt.registerLazySingleton(() => SignInUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveTokenUseCase(getIt()));

  getIt.registerLazySingleton<AuthRepository>(() => LoginRepository());
}
