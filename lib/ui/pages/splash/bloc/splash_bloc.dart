
import 'package:clean_arquitecture/core/bloc/bloc.dart';
import 'package:clean_arquitecture/domain/use_cases/splash/get_user_of_api_use_case.dart';
import 'package:clean_arquitecture/domain/use_cases/splash/get_token_use_case.dart';
import 'package:clean_arquitecture/ui/pages/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashState>{
  
  final GetUserOfAPIUseCase _verificateUserUseCase;
  final GetTokenUseCase _getTokenUseCase; 

  SplashBloc(this._verificateUserUseCase, this._getTokenUseCase) {
    changeState(Initial());
    this._init();
  }

  void _init() async{

    String token=await this._getTokenUseCase.execute();
    if(token!=null){
      print('Token encontrado');
      await Future.delayed(Duration(seconds: 2));
      print('verificando usuario en api...');
      if (await this._verificateUserUseCase.execute(token)){
        print('no se encontro usuario en api');
        return changeState(LoadedWithOutAuth());
      }else{
        print('usuario encontrado en api');
        return changeState(LoadedWithAuth());  
      }
    }else{
      print('No existe token');
      await Future.delayed(Duration(seconds: 2));
      print('Yendo a login');
      return changeState(LoadedWithOutAuth());
    }
  }
}