import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/views/home_screen/home_screen.dart';

class Navbar extends StatelessWidget {
  Navbar({super.key, this.selectedIndex = 0});

  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      // height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              context.goNamed(HomeScreen.id);
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? AppColors.orangeColor
                          : AppColors.offWhitecolor,
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Icon(
                    Icons.home,
                    color: selectedIndex == 0
                        ? AppColors.offWhitecolor
                        : AppColors.blackColor,
                  ),
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: selectedIndex == 0
                        ? AppColors.orangeColor
                        : AppColors.blackColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
