import '../../../../core/constants/app_import.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, errorMessage: null));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, errorMessage: null));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  bool get isFormValid => state.email.isNotEmpty && state.password.length >= 6;

  Future<void> login() async {
    if (!isFormValid) {
      emit(state.copyWith(
        errorMessage: AppStrings.invalidCredentials,
      ));
      return;
    }

    emit(state.copyWith(loginStatus: RequestState.loading));

    try {
      // TODO: Call actual repository login
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(loginStatus: RequestState.success));
    } catch (e) {
      emit(state.copyWith(
        loginStatus: RequestState.error,
        errorMessage: AppStrings.loginFailed,
      ));
    }
  }
}
