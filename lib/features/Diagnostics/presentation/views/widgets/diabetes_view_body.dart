import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/router.dart';
import 'package:disease_detective/core/widgets/custom_app_bar.dart';
import 'package:disease_detective/features/Diagnostics/presentation/manger/diabetes_cubit.dart';
import 'package:disease_detective/features/Diagnostics/presentation/manger/diabetes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DiabetesViewBody extends StatefulWidget {
  const DiabetesViewBody({super.key});
  @override
  State<DiabetesViewBody> createState() => _DiabetesViewBodyState();
}

class _DiabetesViewBodyState extends State<DiabetesViewBody> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    "pregnancies": TextEditingController(),
    "glucose": TextEditingController(),
    "blood_pressure": TextEditingController(),
    "insulin": TextEditingController(),
    "bmi": TextEditingController(),
    "diabetes_pedigree_function": TextEditingController(),
    "age": TextEditingController(),
    "skin_thickness": TextEditingController(),
  };

  @override
  void dispose() {
    for (var c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final data = {
        "pregnancies": int.parse(_controllers["pregnancies"]!.text),
        "glucose": double.parse(_controllers["glucose"]!.text),
        "blood_pressure": int.parse(_controllers["blood_pressure"]!.text),
        "insulin": double.parse(_controllers["insulin"]!.text),
        "bmi": double.parse(_controllers["bmi"]!.text),
        "diabetes_pedigree_function":
            double.parse(_controllers["diabetes_pedigree_function"]!.text),
        "age": int.parse(_controllers["age"]!.text),
        "skin_thickness": int.parse(_controllers["skin_thickness"]!.text),
      };
      context.read<DiabetesCubit>().predict(data);
    }
  }

  Widget _buildField(String key, String label,
      {bool isInt = false,
      double min = double.negativeInfinity,
      double max = double.infinity}) {
    return Card(
      color: AppColor.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: TextFormField(
          controller: _controllers[key],
          keyboardType: TextInputType.numberWithOptions(decimal: !isInt),
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            icon: Icon(_getIconForField(key), color: AppColor.primaryColor),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            final n = num.tryParse(value);
            if (n == null) return 'Invalid number';
            if (n < min) return 'Must be ≥ $min';
            if (n > max) return 'Must be ≤ $max';
            if (isInt && n is! int && n != n.roundToDouble()) {
              return 'Must be integer';
            }
            return null;
          },
        ),
      ),
    );
  }

  IconData _getIconForField(String key) {
    switch (key) {
      case "pregnancies":
        return Icons.pregnant_woman;
      case "glucose":
        return Icons.bloodtype;
      case "blood_pressure":
        return Icons.monitor_heart;
      case "insulin":
        return Icons.medical_services;
      case "bmi":
        return Icons.fitness_center;
      case "diabetes_pedigree_function":
        return Icons.family_restroom;
      case "age":
        return Icons.cake;
      case "skin_thickness":
        return Icons.layers;
      default:
        return Icons.input;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Diabetes Prediction"),
      body: Container(
        decoration: const BoxDecoration(color: AppColor.white),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              color: AppColor.white,
              elevation: 8,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Enter Patient Data",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColor.bodyColor,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildField("pregnancies", "Pregnancies (int)",
                          isInt: true, min: 0, max: 20),
                      _buildField("glucose", "Glucose (float)",
                          min: 0, max: 300),
                      _buildField("blood_pressure", "Blood Pressure (int)",
                          isInt: true, min: 0, max: 200),
                      _buildField("insulin", "Insulin (float)",
                          min: 0, max: 1000),
                      _buildField("bmi", "BMI (float)", min: 0, max: 70),
                      _buildField("diabetes_pedigree_function",
                          "Diabetes Pedigree Function (float)",
                          min: 0, max: 2),
                      _buildField("age", "Age (int)",
                          isInt: true, min: 0, max: 120),
                      _buildField("skin_thickness", "Skin Thickness (int)",
                          isInt: true, min: 0, max: 100),
                      const SizedBox(height: 24),
                      BlocBuilder<DiabetesCubit, DiabetesState>(
                        builder: (context, state) {
                          if (state is DiabetesLoading) {
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor,
                                  foregroundColor:
                                      const Color.fromARGB(255, 214, 107, 107),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                icon: const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                ),
                                label: const Text("Analyzing..."),
                                onPressed: null,
                              ),
                            );
                          }
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              icon: const Icon(Icons.analytics),
                              label: const Text("Predict"),
                              onPressed: () => _submit(context),
                            ),
                          );
                        },
                      ),
                      BlocListener<DiabetesCubit, DiabetesState>(
                        listener: (context, state) {
                          if (state is DiabetesSuccess) {
                            _showResultDialog(
                              context,
                              riskLevel: state.riskLevel,
                              prediction: state.prediction,
                              probability: state.probability,
                            );
                            context.read<DiabetesCubit>().reset();
                          } else if (state is DiabetesError) {
                            _showErrorDialog(context, state.message);
                            context.read<DiabetesCubit>().reset();
                          }
                        },
                        child: const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showResultDialog(BuildContext context,
      {required String riskLevel,
      required int prediction,
      required double probability}) {
    Color color = riskLevel == "Low Risk" ? Colors.green : Colors.red;
    IconData icon = riskLevel == "Low Risk"
        ? Icons.health_and_safety
        : Icons.warning_amber_rounded;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 60),
              const SizedBox(height: 16),
              Text(
                riskLevel,
                style: TextStyle(
                  color: color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Prediction: $prediction",
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                "Probability: ${(probability * 100).toStringAsFixed(2)}%",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(120, 40),
                ),
                icon: const Icon(Icons.check),
                label: const Text("OK"),
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.kHomeView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 16),
              const Text(
                "Error",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(120, 40),
                ),
                icon: const Icon(Icons.close),
                label: const Text("Close"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
