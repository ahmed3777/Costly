import 'package:costly/core/helper_functions/on_generate_route.dart';
import 'package:costly/core/services/custom_bloc_observer.dart';
import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/core/services/notification_service.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/products/presentation/cubit/product/product_cubit.dart';
import 'package:costly/features/services/presentation/cubit/servicescubit/services_cubit.dart';
import 'package:costly/features/home/presentation/cubits/banner/banners_cubit.dart';
import 'package:costly/features/category/presentation/cubit/category/category_cubit.dart';
import 'package:costly/features/splash/presentation/views/splash_view.dart';
import 'package:costly/features/user_profile/presentation/cubit/cubit/user_profile_cubit.dart';
import 'package:costly/firebase_options.dart';
import 'package:costly/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  await SharedPref.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGetIt();
  
  // Initialize notification service
  await getIt<NotificationService>().initialize();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<BannerCubit>()..getBanners(),
        ),
        BlocProvider(
          create: (context) => getIt.get<CategoryCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (context) => getIt.get<ProductCubit>()..getProducts(),
        ),
        BlocProvider(
          create: (context) => getIt.get<ServicesCubit>()..getServices(),
        ),
        BlocProvider(
          create: (context) => getIt.get<UserProfileCubit>()..getUserProfile(),
        ),
        BlocProvider(
          create: (context) => getIt.get<CartCubit>(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              theme: ThemeData(
                fontFamily: 'JosefinSans',
                scaffoldBackgroundColor: Colors.white,
                primaryColor: AppColors.primaryColor,
                colorScheme: const ColorScheme.light(
                  primary: AppColors.primaryColor,
                  secondary: AppColors.secondaryColor,
                ),
              ),
              onGenerateRoute: onGenerateRoute,
              initialRoute: SplashView.routeName,
              debugShowCheckedModeBanner: false,
              locale: const Locale('en'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            );
          }),
    );
  }
}
