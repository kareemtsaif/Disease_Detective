import 'package:health_guard/core/utils/images.dart';
import 'package:health_guard/features/profile/data/models/medical_record_model.dart';

final List<MedicalRecord> medicalRecords = [
    MedicalRecord(
      day: 'Friday',
      condition: 'Breast Cancer',
      date: '1st Dec 2024 at 8:44 AM',
      image: AppImage.diagnosesOne,
    ),
    MedicalRecord(
      day: 'Sunday',
      condition: 'Heart Failure',
      date: '2nd Nov 2024 at 10:44 PM',
      image: AppImage.diagnosesEleven,
    ),
    MedicalRecord(
      day: 'Sunday',
      condition: 'Diabetic Retinopathy',
      date: '3rd Oct 2024 at 7:44 PM',
      image: AppImage.diagnosesThree,
    ),
    MedicalRecord(
      day: 'Sunday',
      condition: 'Asthma',
      date: '4th Nov 2024 at 10:44 PM',
      image: AppImage.diagnosesTwelve,
    ),
  ];


// final List<MedicalRecord> medicalRecords = [
//     {
//       day: 'Friday',
//       'condition': 'Breast Cancer',
//       'date': '1st Dec 2024 at 8:44 AM',
//       'image':AppImage.diagnosesOne
//     },
//     {
//       'day': 'Sunday',
//       'condition': 'Heart Failure',
//       'date': '2nd Nov 2024 at 10:44 PM',
//       'image':AppImage.diagnosesEleven
//     },
//     {
//       'day': 'Sunday',
//       'condition': 'Diabetic Retinopathy',
//       'date': '3rd Oct 2024 at 7:44 PM',
//       'image':AppImage.diagnosesThree
//     },
//     {
//       'day': 'Sunday',
//       'condition': 'Asthma',
//       'date': '4th Nov 2024 at 10:44 PM',
//       'image':AppImage.diagnosesTwelve
//     },
//   ];