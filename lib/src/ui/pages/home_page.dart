import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/src/providers/page_provider.dart';
import 'package:vertical_landing_page/src/ui/shared/shared.dart';
import 'package:vertical_landing_page/src/ui/views/views.dart';
class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildDecoration(),
        child: Stack(
          children: const [
            _HomeBody(),
            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu(),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.red,
        Colors.grey
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        .5,
        .5
      ]
    )
  );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      controller: pageProvider.pageController,
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()
      ],
    );
  }
}