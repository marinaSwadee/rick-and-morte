import 'package:flutter/material.dart';
import 'package:untitled/app_router.dart';

void main() {
  runApp(BreakingApp(appRouter: AppRouter(),));
}

class BreakingApp extends StatelessWidget {
  const BreakingApp({super.key, required this.appRouter});

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,

    );
  }
}
