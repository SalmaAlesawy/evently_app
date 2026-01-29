import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,PageRouteName.onBoarding);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex:2,child: Assets.images.eventlyLogo.image()),
            Assets.images.splashbranding.image(),
          ],
        ),
      ),
    );
  }
}
