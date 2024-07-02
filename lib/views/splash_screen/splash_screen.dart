import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/constants/app_info.dart';
import 'package:money_mate/constants/spacing.dart';
import 'package:money_mate/constants/typography.dart';
import 'package:money_mate/views/auth_screens/sign_in_screen/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String id = "SplashScreen";

  changeScreen(context) {
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).goNamed(SignInScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    changeScreen(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppInfo.appLogo,
              height: 100.w,
              width: 100.w,
            ),
            Spacing.heightBox(20),
            Text(
              AppInfo.appName,
              style: TextStyle(
                fontFamily: Typo.medium,
                fontSize: 30.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
