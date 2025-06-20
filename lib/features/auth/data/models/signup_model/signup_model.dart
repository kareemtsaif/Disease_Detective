import 'package:equatable/equatable.dart';

import 'user.dart';

class SignupModel extends Equatable {
  final String? message;
  final String? token;
  final User? user;

  const SignupModel({this.message, this.token, this.user});

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        message: json['message'] as String?,
        token: json['token'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [message, token, user];
}
