import 'package:flutter/material.dart';
import 'package:disease_detective/core/providers/theme_provider.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/icons.dart';
import 'package:disease_detective/core/widgets/custom_app_bar.dart';
import 'package:disease_detective/core/widgets/custom_divider.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_dialogs_settings.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_navigation_tile.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_section_header_setting.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_setting_card.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_switch_tile.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeProvider themeProvider;

  const SettingsScreen({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeProvider,
      builder: (context, child) {
        final isDark = themeProvider.isDarkMode;

        return Scaffold(
          backgroundColor: isDark ? const Color(0xFF121212) : AppColor.white,
          appBar: const CustomAppBar(title: 'Settings'),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 10),
              _buildAccountSection(),
              const SizedBox(height: 24),
              _buildLanguageSection(context),
              const SizedBox(height: 24),
              _buildSupportSection(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSectionHeaderSetting(title: 'Account'),
        const SizedBox(height: 8),
        CustomSettingCard(
          children: [
            CustomSwitchTile(
              icon: AppIcon.darkMode,
              title: 'Dark Mode',
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleDarkMode(),
            ),
            const CustomDivider(),
            CustomSwitchTile(
              icon: AppIcon.notification,
              title: 'Show Notification',
              value: themeProvider.showNotifications,
              onChanged: (value) => themeProvider.toggleNotifications(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguageSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSectionHeaderSetting(title: 'Language'),
        const SizedBox(height: 8),
        CustomSettingCard(
          children: [
            CustomNavigationTile(
              icon: AppIcon.language,
              title: 'English (US)',
              onTap: () => CustomDialogsSettings.showLanguageDialog(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSectionHeaderSetting(title: 'Support'),
        const SizedBox(height: 8),
        CustomSettingCard(
          children: [
            CustomNavigationTile(
              icon: AppIcon.aboutUs,
              title: 'About us',
              onTap: () => CustomDialogsSettings.showAboutDialog(context),
            ),
            const CustomDivider(),
            CustomNavigationTile(
              icon: AppIcon.deleteAccount,
              title: 'Delete account',
              onTap: () =>
                  CustomDialogsSettings.showDeleteAccountDialog(context),
              isDestructive: true,
            ),
          ],
        ),
      ],
    );
  }
}
