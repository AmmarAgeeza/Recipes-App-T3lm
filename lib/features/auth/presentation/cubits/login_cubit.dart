import 'package:dio/dio.dart';
import 'package:recipes_app_t3lm/features/auth/data/models/login_model.dart';

import '../../../../core/constants/app_import.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void login({required String username, required String password}) async {
    emit(state.copyWith(loginState: RequestState.loading));
    try {
      //api requset [POST]
      //1.get an obj from dio
      final dio = Dio();
      //2.post method
      Response response = await dio.post(
        "https://dummyjson.com/auth/login",
        data: {"username": username, "password": password},
      );
      log(response.statusCode.toString());
      log(response.data['username']);
      LoginModel model = LoginModel.fromJson(response.data);
      emit(state.copyWith(loginState: RequestState.success, loginModel: model));
    } on DioException catch (e) {
      var erroMessage = e.response!.data["message"].toString();
      log(e.response!.data["message"].toString());
      emit(
        state.copyWith(
          loginState: RequestState.error,
          errorMessage: erroMessage,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(loginState: RequestState.error));
    }
  }
}
