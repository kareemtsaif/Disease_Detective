import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/router.dart' show AppRouter;
import 'package:disease_detective/core/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void customDialogLogout(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
        backgroundColor: AppColor.white,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              const Text(
                AppString.logout,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              // Message
              const Text(
                'Are you sure you want to logout  your account?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.subColor,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              // Buttons
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[300]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: AppColor.white,
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: AppColor.bodyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Delete Button
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove('auth_token');
                          context.go(AppRouter.kSignInView);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          foregroundColor: AppColor.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
