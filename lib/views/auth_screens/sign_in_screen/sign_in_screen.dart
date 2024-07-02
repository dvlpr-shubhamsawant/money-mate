import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/constants/app_info.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/constants/spacing.dart';
import 'package:money_mate/constants/typography.dart';
import 'package:money_mate/views/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:money_mate/views/home_screen/home_screen.dart';
import 'package:money_mate/views/shared_widget/custom_button.dart';
import 'package:money_mate/views/shared_widget/custom_textform_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static String id = "SignInScreen";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: Spacing.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppInfo.appLogo,
                height: 50.w,
                width: 50.w,
              ),
              Spacing.heightBox(10),
              Text(
                "Sign In",
                style: TextStyle(fontSize: 18.sp, fontFamily: Typo.semiBold),
              ),
              Spacing.heightBox(20),
              customTextformField(label: "Email ID", icon: Icons.face),
              Spacing.heightBox(10),
              customTextformField(label: "Password", icon: Icons.password),
              Spacing.heightBox(25),
              customFilledButton(
                  title: "Sign In",
                  icon: Icons.login,
                  onpress: () {
                    context.goNamed(HomeScreen.id);
                  }),
              Spacing.heightBox(15),
              Divider(),
              Spacing.heightBox(15),
              GestureDetector(
                onTap: () {
                  context.goNamed(SignUpScreen.id);
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 12.sp),
                    children: [
                      TextSpan(
                        text: "Don't Have an Account, ",
                        style: TextStyle(color: AppColors.textColor),
                      ),
                      TextSpan(
                        text: "Sign UP",
                        style: TextStyle(color: AppColors.orangeColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
