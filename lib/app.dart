import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_app/config/routes/app_navigator.dart';
import 'package:valorant_app/config/routes/app_routes.dart';
import 'package:valorant_app/core/utils/app_strings.dart';
import 'package:valorant_app/core/utils/color_schema.dart';
import 'package:valorant_app/cubits/agent_cubit/agent_cubit.dart';
import 'package:valorant_app/injection_container.dart' as di;

class ValorantApp extends StatelessWidget {
  const ValorantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AgentCubit>(
      create: (context) => di.sl<AgentCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            theme: ThemeData(useMaterial3: true, colorScheme: appColorScheme, scaffoldBackgroundColor: const Color(0xFF3C2A36)),
            onGenerateRoute: AppRoute.onGenerateRoute,
            navigatorKey: AppNavigator.navigatorKey,
          );
        },
      ),
    );
  }
}
