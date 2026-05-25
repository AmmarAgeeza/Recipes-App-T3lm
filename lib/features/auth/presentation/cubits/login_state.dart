import 'package:equatable/equatable.dart';
import 'package:recipes_app_t3lm/core/constants/app_enums.dart';
import 'package:recipes_app_t3lm/features/auth/data/models/login_model.dart';

class LoginState extends Equatable {
  final RequestState loginState;
  final String errorMessage;
  final LoginModel? loginModel;
  const LoginState({
    this.loginState = RequestState.idle,
    this.errorMessage = '',
    this.loginModel,
  });

  LoginState copyWith({
    RequestState? loginState,
    String? errorMessage,
    LoginModel? loginModel,
  }) {
    return LoginState(
      loginState: loginState ?? this.loginState,
      errorMessage: errorMessage ?? this.errorMessage,
      loginModel: loginModel ?? this.loginModel,
    );
  }

  @override
  List<Object?> get props => [loginState];
}

//loading - success - error
