import 'package:flutter/material.dart';
import 'package:health_guard/core/controllers/notification_controller.dart';
import 'package:health_guard/features/home/presentation/views/widgets/greeting_card.dart';
import 'package:health_guard/features/home/presentation/views/widgets/health_assessment_card.dart';
import 'package:health_guard/features/home/presentation/views/widgets/health_tips_section.dart';
import 'package:health_guard/features/home/presentation/views/widgets/recommended_diagnoses_section.dart';

class HomeScreen extends StatelessWidget {
  final NotificationController notificationController;
  final VoidCallback onNotificationTap;
  

  const HomeScreen({
    super.key,
    required this.notificationController,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          ListenableBuilder(
            
            listenable: notificationController,
            builder: (context, child) {
              return GreetingCard(
                notificationCount: notificationController.unreadCount,
                onNotificationTap: onNotificationTap,
              );
            },
          ),
          const SizedBox(height: 20),
           const HealthAssessmentCard(),
          const SizedBox(height: 30),
          const HealthTipsSection(),
          const SizedBox(height: 30),
          const RecommendedDiagnosesSection(),
          const SizedBox(height: 100), // Extra space for bottom nav
        ],
      ),
    );
  }
}
