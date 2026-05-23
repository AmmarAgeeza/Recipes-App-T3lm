import 'package:dartz/dartz.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Future<Either<String, UserModel>> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<String, UserModel>> login(String email, String password) async {
    // TODO: Implement actual API call
    await Future.delayed(const Duration(seconds: 1));
    return Right(UserModel(
      id: '1',
      email: email,
      name: 'Culinara Chef',
    ));
  }
}
