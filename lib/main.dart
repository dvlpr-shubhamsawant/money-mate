import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_mate/constants/app_router.dart';
import 'package:money_mate/constants/app_theme.dart';

import 'package:money_mate/controllers/home_controller.dart';
import 'package:money_mate/firebase_options.dart';
import 'package:money_mate/services/local_notifications.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('ExpenseBox');
  await LocalNotifications.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
