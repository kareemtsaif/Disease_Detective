import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_app_bar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: AppString.privacy),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              // Privacy Policy Content
              Text(
                'Your privacy of most importance to us. We are committed to respecting your privacy and safeguarding any information we collect from you through this health application',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: AppColor.bodyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'We only request personal information that is essential for providing accurate health assessments, recommendations, and to enhance your overall experience. All data is collected through fair and lawful means, with your full knowledge and consent. We make sure to clearly inform you about why your data is needed, how it will be used, and the specific benefits it provides to you. We retain collected information only for as long as necessary to deliver the services you requested. Any stored data is protected with advanced security measures to prevent unauthorized access, misuse, or modification.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: AppColor.bodyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Your personal information is not shared publicly or with third parties, except when explicitly required by law or with your clear consent for specific medical purposes. We value your trust, and any updates to this privacy policy will be communicated transparently to ensure your information is always handled with care and respect',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: AppColor.bodyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
