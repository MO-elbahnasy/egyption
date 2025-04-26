import 'package:egyptifi/authentication_flow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingPages = [
    {
      'title': '',
      'image': 'assets/images/egypt_logo (1).png',
    },
    {
      'title': 'Local Experts',
      'subtitle': 'Skip',
      'image': 'assets/images/P0.png',
    },
    {
      'title': 'Personalized Tours',
      'subtitle': 'Skip',
      'image': 'assets/images/p1png.png',
    },
    {
      'title': 'Smart Filters',
      'subtitle': 'Skip',
      'image': 'assets/images/p2.png',
    },
    {
      'title': 'Secure Payments',
      'subtitle': 'Skip',
      'image': 'assets/images/p3.png',
    },
    {
      'title': 'Native Language Guide',
      'subtitle': 'Skip',
      'image': 'assets/images/p4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: onboardingPages[index]['title']!,
                subtitle: onboardingPages[index]['subtitle'],
                imagePath: onboardingPages[index]['image']!,
                isLastPage: index == onboardingPages.length - 1,
                index: index,
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                    (index) => buildDot(index: index),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: _currentPage == onboardingPages.length - 1
                ? ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                );
              },
              child: const Text('Finish'),
            )
                : TextButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Text('Next',style: TextStyle(color:
              Colors.black)),
            ),
          ),
          if (_currentPage > 0)
            Positioned(
              bottom: 20,
              left: 20,
              child: TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: const Text('Back',style: TextStyle(color: Colors.black),),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}



class OnboardingPage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imagePath;
  final bool isLastPage;
  final int index;
  const OnboardingPage({
    super.key,
    required this.title,
    this.subtitle,
    required this.imagePath,
    this.isLastPage = false, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (subtitle != null)
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                );
              },

              child: Text(subtitle!,style: TextStyle(color: Colors.red),),
            ),
          ),
        const Spacer(),
        Image.asset(
          imagePath,
          width: index!=0 ?  double.infinity :200,
          height:  index!=0 ?  double.infinity :200,
          fit:  BoxFit.fill,
        ),
        const SizedBox(height: 40),
        Visibility(
          visible: index!=0,
          child: Align(
             alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height:180,
              decoration: BoxDecoration(
                color: Color(0xff1f3B43).withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                  topLeft: Radius.circular(150),
                )
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xffEEF7F9)
            ),
          ),
        ),

      ],
    );
  }
}