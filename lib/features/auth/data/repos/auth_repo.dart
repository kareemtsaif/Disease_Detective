import 'package:dartz/dartz.dart';
import 'package:disease_detective/core/errors/failures.dart';
import 'package:disease_detective/features/auth/data/models/login_model/login_model.dart';
import 'package:disease_detective/features/auth/data/models/signup_model/signup_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignupModel>> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirmation,
  );
  Future<Either<Failure, LoginModel>> login(
    String email,
    String password,
  );
}
