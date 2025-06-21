import 'dart:io';
import 'package:disease_detective/core/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/custom_button_secondary.dart';
import 'package:disease_detective/core/widgets/custom_head_title_back_button.dart';
import 'package:disease_detective/features/Diagnostics/presentation/views/breast_cancer_diagnosis_result_view.dart';
import 'package:disease_detective/features/Diagnostics/presentation/views/widgets/custom_smooth_corner_painter.dart';

class BreastCancerDiagnosisBody extends StatefulWidget {
  const BreastCancerDiagnosisBody({super.key});

  @override
  State<BreastCancerDiagnosisBody> createState() =>
      _BreastCancerDiagnosisBodyState();
}

class _BreastCancerDiagnosisBodyState extends State<BreastCancerDiagnosisBody> {
  File? _pickedImage;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        child: Center(
          child: Column(
            children: [
              const CustomHeadTitleBackButton(title: AppString.xRayInsight),
              const SizedBox(height: 100),
              Stack(
                alignment: Alignment.center,
                children: [
                  _pickedImage == null
                      ? CustomPaint(
                          size: const Size(300, 300),
                          painter: CustomSmoothCornerPainter(),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            _pickedImage!,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                  if (_pickedImage == null)
                    const Center(
                      child: Text(
                        AppString.putTheXrayHere,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColor.subColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                ],
              ),
              const Spacer(flex: 2),
              CustomButtonPrimary(
                buttonName: AppString.scan,
                onPressed: () {
                  if (_pickedImage == null) {
                    customSnackbar(context, 'upload a photo first');
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    );
                    Future.delayed(
                      const Duration(seconds: 5),
                      () {
                        Navigator.of(context).pop(); // Close the loading dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BreastCancerDiagnosisResultView(
                              image: _pickedImage!,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 15),
              CustomButtonSecondary(
                buttonName: AppString.uploadAPhoto,
                onPressed: () => _showImageSourceActionSheet(context),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
