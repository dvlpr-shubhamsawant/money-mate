import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/constants/app_router.dart';
import 'package:money_mate/constants/app_theme.dart';
import 'package:money_mate/controllers/auth_controller.dart';
import 'package:money_mate/controllers/home_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MoneyMate());
}

class MoneyMate extends StatelessWidget {
  const MoneyMate({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthController()),
          ChangeNotifierProvider(create: (_) => HomeController()),
        ],
        child: MaterialApp.router(
          theme: AppTheme.themeData,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
