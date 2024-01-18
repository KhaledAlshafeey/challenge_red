import 'package:challenge/resources/app_theme.dart';
import 'package:challenge/utils/snak_bar_helper.dart';
import 'package:challenge/views/post_view/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          title: 'Reddit Challenge',
          scaffoldMessengerKey: ScaffoledHelper.scaffoldKey,
          home: const PostView(),
        );
      },
    );
  }
}
