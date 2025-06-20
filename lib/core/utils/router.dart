import 'package:dio/dio.dart';
import 'package:disease_detective/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/helpers/api_service.dart';
import 'package:disease_detective/features/Diagnostics/presentation/manger/diabetes_cubit.dart';
import 'package:disease_detective/features/Diagnostics/presentation/views/diabetes_view.dart';
import 'package:disease_detective/features/Diagnostics/presentation/views/disease_detection_view.dart';
import 'package:disease_detective/features/Diagnostics/presentation/views/widgets/diabetes_view_body.dart';
import 'package:disease_detective/features/auth/data/repos/auth_repo_impl.dart';
import 'package:disease_detective/features/auth/presentation/manager/signIn/sign_in_cubit.dart';
import 'package:disease_detective/features/auth/presentation/manager/signUp/sign_up_cubit.dart';
import 'package:disease_detective/features/auth/presentation/views/forget_password_view.dart';
import 'package:disease_detective/features/auth/presentation/views/new_password_view.dart';
import 'package:disease_detective/features/auth/presentation/views/sign_in_view.dart';
import 'package:disease_detective/features/auth/presentation/views/sign_up_view.dart';
import 'package:disease_detective/features/auth/presentation/views/verify_email_view.dart';
import 'package:disease_detective/features/home/presentation/views/home_view.dart';
import 'package:disease_detective/features/onBoarding/presentation/manager/onBoarding/on_boarding_cubit.dart';
import 'package:disease_detective/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:disease_detective/features/survey/presentation/views/choose_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onBoardingView';
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';
  static const kChooseView = '/chooseView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kVerifyEmailView = '/verifyEmailView';
  static const kNewPasswordView = '/newPasswordView';
  static const kHomeView = '/homeView';
  static const kDiseaseDetectionView = '/diseaseDetectionView';
  static const kDiabetesView = '/diabetesViewBody';
  static const kDiabetesForm = '/diabetesForm';
  static const kSplashView = '/splashView';

  static GoRouter buildRouter(String initialLocation) {
    return GoRouter(
      initialLocation: initialLocation, // ✅ ده هو التعديل الأساسي
      routes: [
        GoRoute(
          path: kSplashView,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(), // تقدر تغيرها لو عايز
        ),
        GoRoute(
          path: kOnBoardingView,
          builder: (context, state) => BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnboardingView(),
          ),
        ),
        GoRoute(
          path: kSignInView,
          builder: (context, state) => BlocProvider(
            create: (context) => SignInCubit(AuthRepoImpl(ApiService(Dio()))),
            child: const SignInView(),
          ),
        ),
        GoRoute(
          path: kSignUpView,
          builder: (context, state) => BlocProvider(
            create: (context) => SignUpCubit(AuthRepoImpl(ApiService(Dio()))),
            child: const SignUpView(),
          ),
        ),
        GoRoute(
          path: kForgetPasswordView,
          builder: (context, state) => const ForgetPasswordView(),
        ),
        GoRoute(
          path: kVerifyEmailView,
          builder: (context, state) => const VerifyEmailView(),
        ),
        GoRoute(
          path: kNewPasswordView,
          builder: (context, state) => const NewPasswordView(),
        ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: kChooseView,
          builder: (context, state) => const ChooseView(),
        ),
        GoRoute(
          path: kDiseaseDetectionView,
          builder: (context, state) => const DiseaseDetectionView(),
        ),
        GoRoute(
          path: kDiabetesForm,
          builder: (context, state) => const DiabetesViewBody(),
        ),
        GoRoute(
          path: kDiabetesView,
          builder: (context, state) => BlocProvider(
            create: (context) => DiabetesCubit(),
            child: const DiabetesView(),
          ),
        ),
      ],
    );
  }
}
