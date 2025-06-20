import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioexp) {
    switch (dioexp.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioexp.response!.statusCode, dioexp.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled.');
      case DioExceptionType.unknown:
        if (dioexp.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        if (response['email'] != null) {
          if (response['email'] is List && response['email'].isNotEmpty) {
            return ServerFailure(response['email'].first.toString());
          } else {
            // Debug: Unexpected type
            return ServerFailure(response['email'].toString());
          }
        }
        if (response['password'] != null && response['password'] is List) {
          return ServerFailure(response['password'][0].toString());
        }
        if (response['password_confirm'] != null &&
            response['password_confirm'] is List) {
          return ServerFailure(response['password_confirm'][0].toString());
        }
        return ServerFailure('Bad Request');
      case 401:
        if (response['error'] != null && response['error'] is String) {
          return ServerFailure(response['error'].toString());
        }
        return ServerFailure('Unauthorized');
      case 403:
        return ServerFailure('Forbidden');
      case 404:
        return ServerFailure('Not Found');
      case 500:
        return ServerFailure('Internal Server Error');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
