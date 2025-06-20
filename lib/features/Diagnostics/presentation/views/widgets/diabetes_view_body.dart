import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/router.dart';
import 'package:disease_detective/features/Diagnostics/presentation/manger/diabetes_cubit.dart';
import 'package:disease_detective/features/Diagnostics/presentation/manger/diabetes_state.dart';

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
            icon: Icon(_getIconForField(key), color: Colors.teal),
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
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.local_hospital, color: Colors.teal),
            SizedBox(width: 8),
            Text('Diabetes Predictor'),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7FA), Color(0xFFB2DFDB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
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
                          color: Colors.teal,
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
                                  backgroundColor: Colors.teal,
                                  foregroundColor: Colors.white,
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
                                backgroundColor: Colors.teal,
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

































// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:go_router/go_router.dart';
// import 'package:disease_detective/core/utils/colors.dart';
// import 'package:disease_detective/core/utils/router.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';

// // --- Color Palette and Theme ---
// class AppColors {
//   static const Color lightBlue = Color(0xFFE6F4FF);
//   static const Color blue = Color(0xFF4FC3F7);
//   static const Color mediumBlue = Color(0xFF29B6F6);
//   static const Color darkBlue = Color(0xFF00689C);
//   static const Color cardShadow = Color(0x2200689C);
//   static const Color errorRed = Color(0xFFD32F2F);
//   static const Color white = Colors.white;
//   static const Color black = Colors.black;
// }

// final ThemeData appTheme = ThemeData(
//   fontFamily: 'Source Sans Pro',
//   colorScheme: const ColorScheme.light(
//     primary: AppColors.blue,
//     secondary: AppColors.mediumBlue,
//     background: AppColors.lightBlue,
//     error: AppColors.errorRed,
//   ),
//   textTheme: const TextTheme(
//     headlineLarge: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 32,
//       color: AppColors.darkBlue,
//       letterSpacing: 0.5,
//     ),
//     headlineMedium: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: AppColors.darkBlue,
//     ),
//     titleLarge: TextStyle(
//       fontWeight: FontWeight.w600,
//       fontSize: 20,
//       color: AppColors.darkBlue,
//     ),
//     bodyLarge: TextStyle(
//       fontWeight: FontWeight.normal,
//       fontSize: 16,
//       color: AppColors.black,
//     ),
//     bodyMedium: TextStyle(
//       fontWeight: FontWeight.normal,
//       fontSize: 14,
//       color: AppColors.black,
//     ),
//   ),
//   appBarTheme: const AppBarTheme(
//     backgroundColor: AppColors.darkBlue,
//     foregroundColor: AppColors.white,
//     elevation: 0,
//     titleTextStyle: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 22,
//       color: AppColors.white,
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: AppColors.white,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(14)),
//       borderSide: BorderSide(color: AppColors.blue),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(14)),
//       borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
//     ),
//     labelStyle: const TextStyle(color: AppColors.darkBlue),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
//         if (states.contains(MaterialState.pressed)) return AppColors.mediumBlue;
//         if (states.contains(MaterialState.hovered)) return AppColors.darkBlue;
//         return AppColors.darkBlue;
//       }),
//       foregroundColor: MaterialStateProperty.all(AppColors.white),
//       shape: MaterialStateProperty.all(
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       ),
//       padding: MaterialStateProperty.all(
//         const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//       ),
//       textStyle: MaterialStateProperty.all(
//         const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     ),
//   ),
//   cardTheme: CardThemeData(
//     color: AppColors.white,
//     elevation: 6,
//     shadowColor: AppColors.cardShadow,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//     margin: const EdgeInsets.all(16),
//   ),
//   switchTheme: SwitchThemeData(
//     thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
//       if (states.contains(MaterialState.selected)) return AppColors.darkBlue;
//       return AppColors.blue;
//     }),
//     trackColor: MaterialStateProperty.resolveWith<Color>((states) {
//       if (states.contains(MaterialState.selected)) return AppColors.mediumBlue;
//       return AppColors.lightBlue;
//     }),
//   ),
//   radioTheme: RadioThemeData(
//     fillColor: MaterialStateProperty.resolveWith<Color>((states) {
//       if (states.contains(MaterialState.selected)) return AppColors.darkBlue;
//       return AppColors.blue;
//     }),
//     overlayColor: MaterialStateProperty.all(
//       AppColors.mediumBlue.withOpacity(0.2),
//     ),
//   ),
// );

// // --- Reusable Components ---
// class AppButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onPressed;
//   final bool isDestructive;
//   final IconData? icon;
//   const AppButton({
//     super.key,
//     required this.label,
//     required this.onPressed,
//     this.isDestructive = false,
//     this.icon,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       icon: icon != null
//           ? Icon(
//               icon,
//               color: isDestructive ? AppColors.errorRed : AppColors.white,
//             )
//           : const SizedBox.shrink(),
//       label: Text(label),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isDestructive ? AppColors.errorRed : null,
//         foregroundColor: isDestructive ? AppColors.white : null,
//         minimumSize: const Size.fromHeight(48),
//       ),
//       onPressed: onPressed,
//     );
//   }
// }

// class AppCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   final List<Widget> actions;
//   const AppCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//     required this.actions,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon, size: 48, color: AppColors.darkBlue),
//             const SizedBox(height: 12),
//             Text(title, style: Theme.of(context).textTheme.headlineMedium),
//             const SizedBox(height: 8),
//             Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
//             const SizedBox(height: 20),
//             Row(mainAxisAlignment: MainAxisAlignment.end, children: actions),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // --- Step Scaffold with Step Progress Indicator ---
// class StepScaffold extends StatelessWidget {
//   final String title;
//   final int step;
//   final int totalSteps;
//   final Widget child;
//   const StepScaffold({
//     super.key,
//     required this.title,
//     required this.step,
//     required this.totalSteps,
//     required this.child,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: CustomAppBar(title: title),
//       appBar: AppBar(
//         toolbarHeight: 60,
//         title: Text(title,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold, color: AppColor.bodyColor)),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: AppColor.white,
//         leading: Navigator.of(context).canPop()
//             ? IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 color: AppColor.subColor,
//                 onPressed: () => Navigator.of(context).pop(),
//               )
//             : null,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             constraints: const BoxConstraints(maxWidth: 400),
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Step Progress Indicator moved here, above the main text
//                 Column(
//                   children: [
//                     StepProgressIndicator(
//                       totalSteps: totalSteps,
//                       currentStep: step,
//                       size: 12,
//                       padding: 0,
//                       selectedColor: AppColor.primaryColor,
//                       unselectedColor: AppColor.whiteSmoke,
//                       roundedEdges: const Radius.circular(10),
//                       fallbackLength: 300,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       '$step of $totalSteps',
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.black87,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 0.5,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                   ],
//                 ),
//                 child,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // --- Diabetes Prediction Flow ---
// class DiabetesViewBody extends StatelessWidget {
//   const DiabetesViewBody({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Diabetes Predictor',
//       debugShowCheckedModeBanner: false,
//       theme: appTheme,
//       home: const PregnanciesScreen(),
//     );
//   }
// }

// class PregnanciesScreen extends StatelessWidget {
//   const PregnanciesScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     return StepScaffold(
//       title: 'Pregnancies',
//       step: 1,
//       totalSteps: 8,
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             const Text(
//               'Enter the number of pregnancies:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: controller,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Pregnancies',
//                 prefixIcon: Icon(Icons.pregnant_woman),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 32),
//             AppButton(
//               label: 'Next',
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GlucoseScreen(
//                         pregnancies: int.parse(controller.text),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class GlucoseScreen extends StatelessWidget {
//   final int pregnancies;
//   const GlucoseScreen({super.key, required this.pregnancies});
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     return StepScaffold(
//       title: 'Glucose',
//       step: 2,
//       totalSteps: 8,
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             const Text(
//               'Enter your glucose level:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: controller,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Glucose',
//                 prefixIcon: Icon(Icons.bloodtype),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 32),
//             AppButton(
//               label: 'Next',
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => BloodPressureScreen(
//                         pregnancies: pregnancies,
//                         glucose: double.parse(controller.text),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BloodPressureScreen extends StatelessWidget {
//   final int pregnancies;
//   final double glucose;
//   const BloodPressureScreen({
//     super.key,
//     required this.pregnancies,
//     required this.glucose,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     return StepScaffold(
//       title: 'Blood Pressure',
//       step: 3,
//       totalSteps: 8,
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             const Text(
//               'Enter your blood pressure:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: controller,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Blood Pressure',
//                 prefixIcon: Icon(Icons.monitor_heart),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 32),
//             AppButton(
//               label: 'Next',
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => InsulinScreen(
//                         pregnancies: pregnancies,
//                         glucose: glucose,
//                         bloodPressure: int.parse(controller.text),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InsulinScreen extends StatelessWidget {
//   final int pregnancies;
//   final double glucose;
//   final int bloodPressure;
//   const InsulinScreen({
//     super.key,
//     required this.pregnancies,
//     required this.glucose,
//     required this.bloodPressure,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     return StepScaffold(
//       title: 'Insulin',
//       step: 4,
//       totalSteps: 8,
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             const Text(
//               'Enter your insulin level:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: controller,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Insulin',
//                 prefixIcon: Icon(Icons.medical_services),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 32),
//             AppButton(
//               label: 'Next',
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => BmiScreen(
//                         pregnancies: pregnancies,
//                         glucose: glucose,
//                         bloodPressure: bloodPressure,
//                         insulin: double.parse(controller.text),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BmiScreen extends StatelessWidget {
//   final int pregnancies;
//   final double glucose;
//   final int bloodPressure;
//   final double insulin;
//   const BmiScreen({
//     super.key,
//     required this.pregnancies,
//     required this.glucose,
//     required this.bloodPressure,
//     required this.insulin,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     return StepScaffold(
//       title: 'BMI',
//       step: 5,
//       totalSteps: 8,
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             const Text(
//               'Enter your BMI:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: controller,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'BMI',
//                 prefixIcon: Icon(Icons.fitness_center),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 32),
//             AppButton(
//               label: 'Next',
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DiabetesPedigreeScreen(
//                         pregnancies: pregnancies,
//                         glucose: glucose,
//                         bloodPressure: bloodPressure,
//                         insulin: insulin,
//                         bmi: double.parse(controller.text),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DiabetesPedigreeScreen extends StatelessWidget {
//   final int pregnancies;
//   final double glucose;
//   final int bloodPressure;
//   final double insulin;
//   final double bmi;
//   const DiabetesPedigreeScreen({
//     super.key,
//     required this.pregnancies,
//     required this.glucose,
//     required this.bloodPressure,
//     required this.insulin,
//     required this.bmi,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     return StepScaffold(
//       title: 'Diabetes Pedigree',
//       step: 6,
//       totalSteps: 8,
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             const Text(
//               'Enter your diabetes pedigree function:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: controller,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Diabetes Pedigree Function',
//                 prefixIcon: Icon(Icons.family_restroom),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 32),
//             AppButton(
//               label: 'Next',
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AgeScreen(
//                         pregnancies: pregnancies,
//                         glucose: glucose,
//                         bloodPressure: bloodPressure,
//                         insulin: insulin,
//                         bmi: bmi,
//                         diabetesPedigree: double.parse(controller.text),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AgeScreen extends StatelessWidget {
//   final int pregnancies;
//   final double glucose;
//   final int bloodPressure;
//   final double insulin;
//   final double bmi;
//   final double diabetesPedigree;
//   const AgeScreen({
//     super.key,
//     required this.pregnancies,
//     required this.glucose,
//     required this.bloodPressure,
//     required this.insulin,
//     required this.bmi,
//     required this.diabetesPedigree,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//     final formKey = GlobalKey<FormState>();
//     return StepScaffold(
//       title: 'Age',
//       step: 7,
//       totalSteps: 8,
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             const Text(
//               'Enter your age:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: controller,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Age',
//                 prefixIcon: Icon(Icons.cake),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 32),
//             AppButton(
//               label: 'Next',
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SkinThicknessScreen(
//                         pregnancies: pregnancies,
//                         glucose: glucose,
//                         bloodPressure: bloodPressure,
//                         insulin: insulin,
//                         bmi: bmi,
//                         diabetesPedigree: diabetesPedigree,
//                         age: int.parse(controller.text),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SkinThicknessScreen extends StatefulWidget {
//   final int pregnancies;
//   final double glucose;
//   final int bloodPressure;
//   final double insulin;
//   final double bmi;
//   final double diabetesPedigree;
//   final int age;
//   static SharedPreferences? sharedPreferences;
//   static Future<void> initSharedPreferences() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//   const SkinThicknessScreen({
//     super.key,
//     required this.pregnancies,
//     required this.glucose,
//     required this.bloodPressure,
//     required this.insulin,
//     required this.bmi,
//     required this.diabetesPedigree,
//     required this.age,
//   });

//   @override
//   State<SkinThicknessScreen> createState() => _SkinThicknessScreenState();
// }

// class _SkinThicknessScreenState extends State<SkinThicknessScreen> {
//   final _controller = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _loading = false;

//   Future<void> sendToApi() async {
//     setState(() {
//       _loading = true;
//     });

//     try {
//       final dio = Dio();
//       final response = await dio.post(
//         'https://improved-alien-sharply.ngrok-free.app/diabetes/predict/',
//         data: {
//           "pregnancies": widget.pregnancies,
//           "glucose": widget.glucose,
//           "blood_pressure": widget.bloodPressure,
//           "insulin": widget.insulin,
//           "bmi": widget.bmi,
//           "diabetes_pedigree_function": widget.diabetesPedigree,
//           "age": widget.age,
//           "skin_thickness": int.parse(_controller.text),
//         },
//         options: Options(
//           headers: {
//             'key': 'token',
//             'token':'badc4cc4a2655a29423d9bd50560c0eca2cb1fc8',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultScreen(
//               prediction: data['prediction'],
//               probability: data['probability'],
//               riskLevel: data['risk_level'],
//             ),
//           ),
//         );
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Error'),
//             content: Text('Error: ${response.statusCode}'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Error'),
//           content: Text('Failed to connect to API.\n$e'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//     } finally {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StepScaffold(
//       title: 'Skin Thickness',
//       step: 8,
//       totalSteps: 8,
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             const Text(
//               'Enter your skin thickness:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: _controller,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Skin Thickness',
//                 prefixIcon: Icon(Icons.layers),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//             ),
//             const SizedBox(height: 32),
//             AppButton(
//               label: _loading ? 'Loading...' : 'Done',
//               onPressed: () {
//                 if (_loading) return;
//                 if (_formKey.currentState!.validate()) {
//                   sendToApi();
//                 }
//               },
//               icon: _loading ? Icons.hourglass_empty : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ResultScreen extends StatelessWidget {
//   final int prediction;
//   final double probability;
//   final String riskLevel;

//   const ResultScreen({
//     super.key,
//     required this.prediction,
//     required this.probability,
//     required this.riskLevel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Color riskColor;
//     if (riskLevel.toLowerCase().contains('low')) {
//       riskColor = AppColors.blue;
//     } else if (riskLevel.toLowerCase().contains('medium')) {
//       riskColor = AppColors.mediumBlue;
//     } else {
//       riskColor = AppColors.darkBlue;
//     }

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFE6F4FF), Color(0xFF00689C)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Card(
//             elevation: 12,
//             margin: const EdgeInsets.all(24),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(24),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     riskColor == AppColors.blue
//                         ? Icons.check_circle
//                         : riskColor == AppColors.mediumBlue
//                             ? Icons.warning
//                             : Icons.error,
//                     color: riskColor,
//                     size: 80,
//                   ),
//                   const SizedBox(height: 24),
//                   Text(
//                     riskLevel,
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: riskColor,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Probability: ${(probability * 100).toStringAsFixed(2)}%',
//                     style: const TextStyle(fontSize: 22),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Prediction: ${prediction == 1 ? "Diabetic" : "Not Diabetic"}',
//                     style: const TextStyle(fontSize: 22),
//                   ),
//                   const SizedBox(height: 40),
//                   AppButton(
//                     label: 'Start Over',
//                     icon: Icons.restart_alt,
//                     onPressed: () {
//                                           GoRouter.of(context).go(AppRouter.kHomeView);

//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DiabetesFormData {
//   int? pregnancies;
//   double? glucose;
//   int? bloodPressure;
//   double? insulin;
//   double? bmi;
//   double? diabetesPedigree;
//   int? age;
//   int? skinThickness;

//   void clear() {
//     pregnancies = null;
//     glucose = null;
//     bloodPressure = null;
//     insulin = null;
//     bmi = null;
//     diabetesPedigree = null;
//     age = null;
//     skinThickness = null;
//   }
// }




