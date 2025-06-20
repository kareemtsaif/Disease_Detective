abstract class DiabetesState {}

class DiabetesInitial extends DiabetesState {}

class DiabetesLoading extends DiabetesState {}

class DiabetesSuccess extends DiabetesState {
  final String riskLevel;
  final int prediction;
  final double probability;
  DiabetesSuccess(this.riskLevel, this.prediction, this.probability);
}

class DiabetesError extends DiabetesState {
  final String message;
  DiabetesError(this.message);
}