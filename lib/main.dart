import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final hasSeenOnboarding = prefs.getBool('seenOnboarding') ?? false;
  final token = prefs.getString('auth_token');

  // حدد بداية الراوتر بناء على الحالة
  late final String initialRoute;

  if (!hasSeenOnboarding) {
    initialRoute = AppRouter.kOnBoardingView;
  } else if (token != null && token.isNotEmpty) {
    initialRoute = AppRouter.kHomeView;
  } else {
    initialRoute = AppRouter.kSignInView;
  }

  runApp(DiseaseDetective(initialRoute: initialRoute));
}

class DiseaseDetective extends StatelessWidget {
  final String initialRoute;

  const DiseaseDetective({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.buildRouter(initialRoute); // هنا بنمرر البداية

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColor.white,
        fontFamily: 'Source Sans Pro',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
