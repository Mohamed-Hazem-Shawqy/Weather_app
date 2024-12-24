import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/custom/on_boarding.dart';
import 'package:weather_app/views/home.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          children: const [
            Onboarding(
                image: 'assets/onboard1.png',
                title: 'Get the weather of your country'),
            Onboarding(
                image: 'assets/onboard2.png',
                title: 'Get the weather of your country'),
            Onboarding(
                image: 'assets/onboard3.jpeg',
                title: 'Get the weather of your country')
          ],
        ),
        Positioned(
          bottom: 100,
          left: 130,
          child: SmoothPageIndicator(
              controller: pageController, // PageController
              count: 3,
              effect: const SwapEffect(), // your preferred effect
              onDotClicked: (index) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutExpo);
              }),
        ),
        Positioned(
          bottom: 30,
          right: 0,
          child: TextButton(
              onPressed: () {
                if (currentIndex != 2) {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutQuad);
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }
              },
              child:
                  currentIndex == 2 ? const Text('Start') : const Text('Next')),
        )
      ]),
    );
  }
}
