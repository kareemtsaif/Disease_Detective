import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? email;
  final bool? isCreator;
  final String? firstName;
  final String? lastName;

  const User({
    this.id,
    this.email,
    this.isCreator,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        email: json['email'] as String?,
        isCreator: json['is_creator'] as bool?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'is_creator': isCreator,
        'first_name': firstName,
        'last_name': lastName,
      };

  @override
  List<Object?> get props => [id, email, isCreator, firstName, lastName];
}
