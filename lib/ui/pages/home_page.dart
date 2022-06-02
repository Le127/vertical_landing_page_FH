import 'package:flutter/material.dart';
import 'package:vertical_landing_page/ui/views/about_view.dart';
import 'package:vertical_landing_page/ui/views/location_view.dart';
import 'package:vertical_landing_page/ui/views/pricing_view.dart';

import '../shared/custom_app_menu.dart';
import '../views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: const [
            //Home
            _HomeBody(),

            //Menu
            Positioned(right: 20, top: 20, child: CustomAppMenu()),
          ],
        ),
      ),
    );
  }

  // Gradiente de fondo para evitar colores no deseados en el final del scroll
  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
          colors: [Colors.pink, Colors.purpleAccent],
        ),
      );
}

//Crea el cuerpo del Home
class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        LocationView(),
      ],
    );
  }
}
