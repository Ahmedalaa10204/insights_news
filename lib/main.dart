import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_styles.dart';
import 'package:insights_news/features/manager/new_cubit.dart';
import 'package:insights_news/features/splash_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.background,
            foregroundColor: AppColors.white,
            centerTitle: true,
            titleTextStyle:
                getBodyStyle(fontSize: 20, color: AppColors.primary),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.background,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            fillColor: AppColors.cardColor,
            hintStyle: getSmallStyle(),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}