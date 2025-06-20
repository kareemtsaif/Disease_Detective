import 'package:flutter/material.dart';
import 'package:disease_detective/core/providers/theme_provider.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/icons.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/features/profile/presentation/views/screens/edit_profile_screen.dart';
import 'package:disease_detective/features/profile/presentation/views/screens/medical_history_screen.dart';
import 'package:disease_detective/features/profile/presentation/views/screens/privacy_screen.dart';
import 'package:disease_detective/features/profile/presentation/views/screens/settings_screen.dart';
import 'package:disease_detective/core/widgets/custom_divider.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_dialog_logout.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_profile_option.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = ThemeProvider();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          AppString.profile,
          style: TextStyle(
            color: AppColor.bodyColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          // Profile Image with Camera Overlay
          const CustomProfileImage(),
          const SizedBox(height: 48),
          // Profile Options List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                CustomProfileOption(
                  icon: AppIcon.editProfile,
                  title: AppString.editProfile,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                ),
                const CustomDivider(),
                CustomProfileOption(
                  icon: AppIcon.medicalHistory,
                  title: AppString.medicalHistory,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicalHistoryScreen(),
                      ),
                    );
                  },
                ),
                const CustomDivider(),
                CustomProfileOption(
                  icon: AppIcon.settings,
                  title: AppString.settings,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(
                          themeProvider: themeProvider,
                        ),
                      ),
                    );
                  },
                ),
                const CustomDivider(),
                CustomProfileOption(
                  icon: AppIcon.privacy,
                  title: AppString.privacy,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyScreen(),
                      ),
                    );
                  },
                ),
                const CustomDivider(),
                CustomProfileOption(
                  icon: AppIcon.logout,
                  title: AppString.logout,
                  isLogout: true,
                  onTap: () {
                    customDialogLogout(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
