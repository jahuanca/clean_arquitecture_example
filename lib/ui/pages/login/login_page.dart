import 'package:clean_arquitecture/core/colors.dart';
import 'package:clean_arquitecture/core/strings.dart';
import 'package:clean_arquitecture/di/dependencies_provider.dart';
import 'package:clean_arquitecture/ui/pages/login/bloc/login_bloc.dart';
import 'package:clean_arquitecture/ui/pages/login/bloc/login_state.dart';
import 'package:clean_arquitecture/ui/widgets/button_widget.dart';
import 'package:clean_arquitecture/ui/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatelessWidget {
  
  final LoginBloc _bloc;

  LoginPage() : _bloc= getIt<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundPagesColor,
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height*0.95,
            child: Row(
              children: [
                StreamBuilder<LoginState>(
                  initialData: _bloc.state,
                  stream: _bloc.observableState,
                   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData){
                      var state=snapshot.data;
                      if(state is LoginAuthenticated){
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Bienvenido'),
                          ));

                        }); 

                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pushReplacementNamed('home');
                        }); 
                      }

                      if(state is LoginUnauthenticated){
                        print('error');
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Error'),
                          ));
                        }); 
                      }

                    }
                    return Container();
                        
                      
                   },
                ),
                Flexible(child: Container(), flex: 1),
                Flexible(child: Column(
                  children: [
                    _topImage(size),
                    _fields(size),
                    _buttons(size)
                  ],
                ), flex: 6),
                Flexible(child: Container(), flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topImage(Size size) {
    return Expanded(flex: 2,
      child: Container(
        padding: EdgeInsets.only(top: size.height*0.06),
        
        child: Image.asset('${rImages}img_layer_logo.png')
      )
    );
  }

  Widget _fields(Size size) {
    return Expanded(flex: 3,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InputWidget(size: size, placeholder: 'Usuario',icon: Icons.person, textEditingController: _bloc.userController,),
        InputWidget(size: size, placeholder: 'Contraseña',icon: Icons.lock,textEditingController: _bloc.passwordController,),
        InputWidget(size: size, placeholder: 'Perfil',icon: Icons.arrow_drop_down, textEditingController: _bloc.perfilController,),
      ],
    ),);
  }

  Widget _buttons(Size size) {
    return Expanded(flex: 2,child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWidget(size: size, title: 'Ingresar', onPressed: _bloc.onLogin,),
          Container(
            child: Text('¿Ha olvidado su contraseña?', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),)
          )
        ],
      )
    );
  }
}