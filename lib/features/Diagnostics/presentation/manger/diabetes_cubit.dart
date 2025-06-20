import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:health_guard/core/functions/auto_token_manger.dart';
import 'package:health_guard/features/Diagnostics/presentation/manger/diabetes_state.dart';

class DiabetesCubit extends Cubit<DiabetesState> {
  DiabetesCubit() : super(DiabetesInitial());

  Future<void> predict(Map<String, dynamic> data) async {

        final token = await AuthTokenManager.getToken();
    emit(DiabetesLoading());
    try {
      final dio = Dio();
      final response = await dio.post(
        'https://improved-alien-sharply.ngrok-free.app/diabetes/predict/',
        data: data,
        options: Options(
          headers: {
            'key': 'token',
            'token': token.toString(),
            'Content-Type': 'application/json',
          },
        ),
      );
      final body = response.data;
      if (response.statusCode == 200 && body['prediction'] != null) {
        emit(DiabetesSuccess(
          body['risk_level'],
          body['prediction'],
          body['probability'],
        ));
      } else if (body['Error'] != null) {
        emit(DiabetesError(body['Error'][0]['msg']));
      } else {
        emit(DiabetesError("Unknown error: ${response.data}"));
      }
    } catch (e) {
      emit(DiabetesError("Failed to connect: $e"));
    }
  }

  void reset() => emit(DiabetesInitial());
}