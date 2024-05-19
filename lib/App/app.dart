
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Bloc/app_language_bloc/app_language_bloc.dart';
import 'package:medicinestore/Bloc/auth_bloc/auth_bloc.dart';
import 'package:medicinestore/Bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:medicinestore/Bloc/main_bloc/main_bloc.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Splash/splash_screen.dart';
import 'package:medicinestore/Util/GeneralRoute.dart';
import 'package:medicinestore/Util/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:medicinestore/Util/environment.dart';

import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AppLanguageBloc()..add(InitLanguage()),
            ),
      
            BlocProvider(
              create: (context) => ConnectivityBloc(),
            ),
            BlocProvider(
              create: (context) => MainBloc(),
            ),
            BlocProvider(
              create: (context) => AuthBloc(),
            ),
          ],
          child: BlocBuilder<AppLanguageBloc, ChangeLanguageState>(
            builder: (context, state) {
              return MaterialApp(
                color: AppColors.primaryColor,
                title: Environment.appName,
          
                debugShowCheckedModeBanner: false,
                locale: Locale(AppSharedPreferences.getArLang),
                supportedLocales: const [Locale('en', 'US'), Locale('ar')],
                localizationsDelegates: const [
                  Applocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                navigatorKey: GeneralRoute.navigatorKey,
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                home: const SplashScreen(),
              );
            },
          )),
    );
  }
}
