import 'package:book_widgets/app/modules/core/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  
  @override
  Widget build(BuildContext context){
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Application Name',
      theme: CustomThemeExtension.lightTheme,
      routerConfig: Modular.routerConfig,
    );
  }
}