import 'package:doctor_system/core/di/dependency_injection.dart';
import 'package:doctor_system/core/routing/routes.dart';
import 'package:doctor_system/features/home/logic/home_cubit.dart';
import 'package:doctor_system/features/home/ui/home_screen.dart';
import 'package:doctor_system/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_system/features/login/ui/login_screen.dart';
import 'package:doctor_system/features/onboarding/onboarding_screen.dart';
import 'package:doctor_system/features/sign_up/logic/sign_up_cubit.dart';
import 'package:doctor_system/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt()),
            child: const HomeScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
