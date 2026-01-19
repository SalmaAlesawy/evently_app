import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                child: const Center(
                    child: Text(
                  "page1",
                  style: TextStyle(color: Colors.black),
                )),
              ),
              Container(
                child: const Center(
                    child:
                        Text("page2", style: TextStyle(color: Colors.black))),
              ),
              Container(
                child: const Center(
                    child:
                        Text("page3", style: TextStyle(color: Colors.black))),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
              left: 150,
              child: SmoothPageIndicator(controller: _controller, count: 3))
        ],
      )),
    );
  }
}
