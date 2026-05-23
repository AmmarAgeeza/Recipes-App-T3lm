import 'package:equatable/equatable.dart';
import '../../../../core/constants/app_enums.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final RequestState loginStatus;
  final String? errorMessage;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.loginStatus = RequestState.idle,
    this.errorMessage,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    RequestState? loginStatus,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      loginStatus: loginStatus ?? this.loginStatus,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, isPasswordVisible, loginStatus, errorMessage];
}
