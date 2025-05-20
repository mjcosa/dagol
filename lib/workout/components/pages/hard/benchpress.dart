import 'package:flutter/material.dart';

class BenchPressPage extends StatefulWidget {
  const BenchPressPage({super.key});

  @override
  State<BenchPressPage> createState() => _BeginnerWorkoutPageState();
}

class _BeginnerWorkoutPageState extends State<BenchPressPage> {
  bool isPlaying = false;
  bool isStarTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Advance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.search, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.notifications, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.person, color: Colors.white),
                    ],
                  )
                ],
              ),
            ),


            // Workout Image with Container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/intermediateexercise3.jpeg'), // Replace with your image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Animated Play Button
                  GestureDetector(
                    onTap: () {
                      setState(() => isPlaying = true);
                      Future.delayed(const Duration(milliseconds: 400), () {
                        setState(() => isPlaying = false);
                      });
                    },
                    child: AnimatedScale(
                      scale: isPlaying ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: AnimatedOpacity(
                        opacity: isPlaying ? 0.6 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(Icons.play_circle_fill,
                            color: Colors.deepPurpleAccent, size: 80),
                      ),
                    ),
                  ),

                  // Animated Star Icon
                  Positioned(
                    top: 12,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        setState(() => isStarTapped = true);
                        Future.delayed(const Duration(milliseconds: 400), () {
                          setState(() => isStarTapped = false);
                        });
                      },
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: isStarTapped ? 1 : 0,
                        child: const Icon(Icons.star, color: Colors.pinkAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Workout Title
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'Bench Press',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Workout Info Row
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white24),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoChip(icon: Icons.fitness_center, label: '3 Sets'),
                  InfoChip(icon: Icons.repeat, label: '8-10 Rep'),
                  InfoChip(icon: Icons.flash_on, label: 'Medium - Hard'),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                'The bench press is a compound upper-body exercise that builds increased strength and muscle development in the chest, shoulders, biceps, and triceps.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
