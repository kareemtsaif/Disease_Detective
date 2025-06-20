import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_guard/core/errors/failures.dart';
import 'package:health_guard/core/helpers/api_service.dart';
import 'package:health_guard/features/auth/data/models/login_model/login_model.dart';
import 'package:health_guard/features/auth/data/models/signup_model/signup_model.dart';
import 'package:health_guard/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SignupModel>> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      var data = await apiService.post(
        endPoint: 'user/register/',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'password_confirm': passwordConfirmation,
        },
      );
      return right(SignupModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, LoginModel>> login(
      String email, String password) async {
    try {
      var data = await apiService.post(
        endPoint: 'user/login/',
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(LoginModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
