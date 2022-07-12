import 'package:app/application/ui/navigation/main_navigation.dart';
import 'package:app/application/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      routes: MainNavigation.routes
    );
  }
}
