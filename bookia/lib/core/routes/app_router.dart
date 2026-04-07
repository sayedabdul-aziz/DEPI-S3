import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/login_register/page/login_screen.dart';
import 'package:bookia/features/auth/presentation/login_register/page/register_screen.dart';
import 'package:bookia/features/details/page/details_screen.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/page/search_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // config
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(path: Routes.main, builder: (context, state) => MainAppScreen()),
      GoRoute(
        path: Routes.details,
        builder: (context, state) =>
            DetailsScreen(book: state.extra as Product),
      ),

      GoRoute(
        path: Routes.search,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit()..search(''),
          child: SearchScreen(),
        ),
      ),
    ],
  );
}
