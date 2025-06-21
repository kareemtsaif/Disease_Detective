import 'package:disease_detective/core/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/custom_head_title.dart';
import 'package:disease_detective/core/widgets/custom_sub_title.dart';
import 'package:disease_detective/features/survey/data/static/survey_list.dart';
import 'package:disease_detective/features/survey/presentation/views/survey_finish_view.dart';
import 'package:disease_detective/core/widgets/custom_button_secondary.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SurveyViewBody extends StatefulWidget {
  final int currentIndex;

  const SurveyViewBody({super.key, required this.currentIndex});

  @override
  SurveyViewBodyState createState() => SurveyViewBodyState();
}

class SurveyViewBodyState extends State<SurveyViewBody> {
  String? selectedAnswer;
  static List<bool?> answers = List.filled(surveyQuestions.length, false);
  @override
  Widget build(BuildContext context) {
    final question = surveyQuestions[widget.currentIndex];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 18, right: 18, bottom: 15),
            child: Column(
              children: [
                const CustomHeadTitle(title: AppString.survey),
                const SizedBox(height: 15),
                const CustomSubTitle(subtitle: AppString.subTitleSurvey),
                const SizedBox(height: 55),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomHeadTitle(
                      title: AppString.personalHealthAssessment,
                      size: 16,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 4),
                  child: StepProgressIndicator(
                    padding: 0,
                    totalSteps: surveyQuestions.length,
                    currentStep: widget.currentIndex + 1,
                    size: 10,
                    selectedColor: AppColor.primaryColor,
                    unselectedColor: AppColor.whiteSmoke,
                    roundedEdges: const Radius.circular(25),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.currentIndex + 1}/${surveyQuestions.length}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.subColor,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      question['question'],
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (question['type'] == 'radio') ...[
                  ...List.generate(
                    question['options'].length,
                    (index) => RadioListTile<String>(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      dense: true,
                      activeColor: AppColor.primaryColor,
                      title: Text(
                        question['options'][index],
                        style: const TextStyle(
                          color: AppColor.bodyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      value: question['options'][index],
                      groupValue: selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;

                          answers[widget.currentIndex] = value == "Yes";
                        });
                      },
                    ),
                  ),
                ],
                const SizedBox(height: 110),
                CustomButtonPrimary(
                  onPressed: () {
                    if (selectedAnswer == null) {
                      customSnackbar(
                          context, "Please select an answer before continuing");
                      return;
                    }
                    if (widget.currentIndex < surveyQuestions.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurveyViewBody(
                            currentIndex: widget.currentIndex + 1,
                          ),
                        ),
                      );
                    } else {
                      Map<String, String> resultData = calculateResult();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SurveyFinishView(resultData: resultData)),
                      );
                    }
                  },
                  buttonName: widget.currentIndex < surveyQuestions.length - 1
                      ? 'Next'
                      : 'Finish',
                ),
                const SizedBox(height: 16),
                if (widget.currentIndex >= 0)
                  CustomButtonSecondary(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonName: AppString.back,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<String, String> calculateResult() {
    bool hasFluSymptoms = answers[0] == true &&
        answers[1] == true &&
        answers[2] == true &&
        answers[3] == true &&
        answers[4] == true &&
        answers[5] == true &&
        answers[6] == true;
    bool hasFeverSymptoms = answers[7] == true &&
        answers[8] == true &&
        answers[9] == true &&
        answers[10] == true &&
        answers[11] == true &&
        answers[12] == true &&
        answers[13] == true &&
        answers[14] == true;

    String result = "";
    String advice1 = "";
    String advice2 = "";
    String advice3 = "";

    if (answers.every((answer) => answer == false)) {
      result =
          "You do not have any disease.Here are some \nsuggested recommendations to take care\n of your health :";
      advice1 = "However, if you feel unwell later, please consult a doctor.";
      advice2 =
          "Stay active by exercising regularly to keep your body fit and reduce the risk of chronic diseases.";
      advice3 =
          "Continue maintaining a healthy lifestyle by eating a balanced diet, rich in fruits and vegetables.";
    } else if (hasFluSymptoms) {
      result =
          "You may have the Flu.here are some suggested\n recommendations :";
      advice1 = "Rest and drink plenty of fluids.";
      advice2 = " Take over-the-counter medicine to relieve symptoms.";
      advice3 = "Monitor your symptoms, and if they worsen, consult a doctor.";
    } else if (hasFeverSymptoms) {
      result =
          "You may have a Fever.here are some suggested\n recommendations :";
      advice1 = "Rest and stay hydrated.";
      advice2 = "Use fever-reducing medication like paracetamol.";
      advice3 =
          "If the fever persists for more than 3 days, or if you have other severe symptoms, seek medical attention.";
    } else {
      result =
          "Symptoms detected; Please consult a doctor for\n a proper diagnosis. here are some suggested\n recommendations :";
      advice1 = "seeing a healthcare professional for further examination.";
      advice2 =
          " Rest and avoid contact with others if you're feeling unwell to reduce the risk of spreading illness.";
      advice3 =
          "Practice good hygiene, such as frequent hand washing, to prevent the spread of any potential infections to others";
    }
    return {
      'result': result,
      'advice1': advice1,
      "advice2": advice2,
      "advice3": advice3
    };
  }
}
