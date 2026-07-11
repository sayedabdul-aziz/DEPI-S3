import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/user_type_enum.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ety/features/auth/presentation/page/login_screen.dart';
import 'package:se7ety/features/auth/presentation/page/register_screen.dart';
import 'package:se7ety/features/intro/onboarding/onboarding_screen.dart';
import 'package:se7ety/features/intro/splash/splash_screen.dart';
import 'package:se7ety/features/intro/welcome/welcome_screen.dart';
import 'package:se7ety/features/patient/booking/presentation/booking_screen.dart';
import 'package:se7ety/features/patient/doctor_profile/page/doctor_profile_screen.dart';
import 'package:se7ety/features/patient/home/presentation/page/specialization_search_screen.dart';
import 'package:se7ety/features/patient/main/patient_main_screen.dart';
import 'package:se7ety/features/patient/settings/page/settings_view.dart';
import 'package:se7ety/features/patient/settings/page/user_details.dart';
import 'package:se7ety/features/update_doctor/cubit/update_doctor_profile_cubit.dart';
import 'package:se7ety/features/update_doctor/page/doctor_registeration_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String doctorRegistration = '/doctorRegistration';
  static const String mainPatient = '/mainPatient';
  static const String specializationSearch = '/specializationSearch';
  static const String homeSearch = '/homeSearch';
  static const String doctorProfile = '/doctorProfile';
  static const String bookingScreen = '/bookingScreen';
  static const String settings = '/settings';
  static const String updatePatient = '/updatePatient';

  static final routes = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(userType: state.extra as UserTypeEnum),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(userType: state.extra as UserTypeEnum),
        ),
      ),
      GoRoute(
        path: doctorRegistration,
        builder: (context, state) => BlocProvider(
          create: (context) => UpdateDoctorProfileCubit(),
          child: UpdateDoctorProfileScreen(),
        ),
      ),
      GoRoute(
        path: mainPatient,
        builder: (context, state) => const PatientMainAppScreen(),
      ),
      GoRoute(
        path: specializationSearch,
        builder: (context, state) =>
            SpecializationSearchScreen(specialization: state.extra as String),
      ),

      GoRoute(
        path: doctorProfile,
        builder: (context, state) =>
            DoctorProfileScreen(doctorModel: state.extra as DoctorModel),
      ),
      GoRoute(
        path: bookingScreen,
        builder: (context, state) =>
            BookingScreen(doctor: state.extra as DoctorModel),
      ),
      GoRoute(path: settings, builder: (context, state) => SettingsScreen()),
      GoRoute(
        path: updatePatient,
        builder: (context, state) => UpdatePatientScreen(),
      ),
    ],
  );
}
