import 'package:dagol/loginscreen/loginpage.dart';
import 'package:dagol/menu/homepage.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

final List<Map<String, String>> screens = [
    {
      'title': 'The Gym of Legends',
      'backgroundImage': 'images/unsplashlogo.jpg',
      'button': 'Next',
    },
    {
      'title': 'Get Fit',
      'backgroundImage': 'images/unsplash.jpg',
      'description': 'Start Your Journey Towards A More Active Lifestyle',
      'button': 'Next',
    },
    {
      'title': 'Get Healthy',
      'backgroundImage': 'images/unsplash2.jpg',
      'description': 'Find Nutrition Tips That Fit Your Lifestyle',
      'button': 'Next',
    },
    {
      'title': 'Start Your Journey',
      'backgroundImage': 'images/unsplash1.jpg',
      'description': 'A Community For You, Challenge Yourself!',
      'button': 'Get Started',
    },
  ];


  void _nextPage() {
    if (_currentPage < screens.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Placeholder()));
    }
  }

  void _skipToEnd() {
    _pageController.animateToPage(
      screens.length - 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF232323),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: screens.length,
            itemBuilder: (context, index) {
              final screen = screens[index];
              return Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                      child: Image.asset(
                        screen['backgroundImage']!,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        if (_currentPage != screens.length - 1)
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextButton(
                                onPressed: _skipToEnd,
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        
                        // Logo only on first screen
                        if (index == 0)
                          Expanded(
                            child: Center(
                              child: AnimatedOpacity(
                                opacity: 0.8, // slightly transparent
                                duration: const Duration(milliseconds: 800),
                                child: Container(
                                  width: screenSize.width * 0.5,
                                  height: screenSize.width * 0.5, // Make it perfectly circular
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(150), // Super round
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: Image.network(
                                      'https://cdn.builder.io/api/v1/image/assets/TEMP/672c2a68cec3411039a116410346f9a550302206?placeholderIfAbsent=true&apiKey=41aedbfc202f4fad9ee59f7f26112921',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),


                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            screen['title'] ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'League Spartan',
                              letterSpacing: 1.2,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 6,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Description Container for 2nd, 3rd, 4th screens
                        if (index != 0)
                          Expanded(
                            child: Center(
                              child: AnimatedOpacity(
                                opacity: 0.9,
                                duration: const Duration(milliseconds: 800),
                                child: Container(
                                  width: screenSize.width * 1, // Almost full width
                                  height: screenSize.height * 0.2, // Half screen height
                                  margin: const EdgeInsets.symmetric(vertical: 20),
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 223, 114, 114),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      screen['description'] ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        color: Color(0xFF232323), // Dark text
                                        fontWeight: FontWeight.w600,
                                        height: 1.5,
                                        fontFamily: 'League Spartan',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),


                        const Spacer(),

                        // Progress Dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            screens.length,
                            (dotIndex) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentPage == dotIndex ? 20 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentPage == dotIndex
                                    ? const Color(0xFF896CFE) // Purple active
                                    : Colors.white70,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
                          child: GestureDetector(
                            onTap: () {
                              if (_currentPage == screens.length-1) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                                );
                              } else {
                                _nextPage(); 
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              width: screenSize.width * 0.6,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 224, 217, 217), 
                                  width: 0.5,
                                ),
                                color: Colors.white.withOpacity(0.1), 
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 204, 202, 202).withOpacity(0.4),
                                    blurRadius: 12,
                                  ),
                                ],
                                backgroundBlendMode: BlendMode.overlay,
                              ),
                              child: Center(
                                child: Text(
                                  _currentPage == screens.length - 1 ? 'Get Started' : 'Next', 
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}