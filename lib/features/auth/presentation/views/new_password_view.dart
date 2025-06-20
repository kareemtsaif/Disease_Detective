import 'package:flutter/material.dart';
import 'package:health_guard/features/auth/presentation/views/widgets/new_password_view_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewPasswordViewBody(),
    );
  }
}
