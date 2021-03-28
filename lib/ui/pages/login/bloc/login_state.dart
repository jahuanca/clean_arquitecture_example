abstract class LoginState{
  
}

class LoginUninitialized extends LoginState {}

class LoginAuthenticated extends LoginState {}

class LoginUnauthenticated extends LoginState {}

class LoginLoading extends LoginState {}