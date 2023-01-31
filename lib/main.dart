import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/src/providers/page_provider.dart';
import 'package:vertical_landing_page/src/router/app_router.dart';

void main() => runApp(const AppState());


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        )
      ],
      child: const VerticalLandingPage(),
    );
  }
}


class VerticalLandingPage extends StatefulWidget {
  const VerticalLandingPage({super.key});

  @override
  State<VerticalLandingPage> createState() => _VerticalLandingPageState();
}

class _VerticalLandingPageState extends State<VerticalLandingPage> {
  @override
  void initState() {
    AppRouter.configureRoutes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page',
      initialRoute: '/about',
      onGenerateRoute: AppRouter.router.generator,
    );
  }
}