import 'package:equatable/equatable.dart';

import 'user.dart';

class LoginModel extends Equatable {
  final User? user;
  final String? token;

  const LoginModel({this.user, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
      };

  @override
  List<Object?> get props => [user, token];
}
