import 'package:dagol/workout/components/hard.dart';
import 'package:dagol/workout/components/pages/inter/bicepcurl.dart';
import 'package:dagol/workout/components/pages/inter/rope.dart';
import 'package:dagol/workout/components/pages/inter/splitsquat.dart';
import 'package:flutter/material.dart';
import '../workouts.dart';

class InterWorkoutPage extends StatelessWidget {
  const InterWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Return WorkoutScreen directly; styling and theming handled globally
    return const InterWorkoutScreen();
  }
}

class InterWorkoutScreen extends StatelessWidget {
  const InterWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable Content
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.chevron_left,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Workout',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.search, color: Colors.white),
                          SizedBox(width: 20),
                          Icon(Icons.notifications, color: Colors.white),
                          SizedBox(width: 20),
                          Icon(Icons.person, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Category Filters
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        CategoryFilter(label: 'Beginner'),
                        SizedBox(width: 12),
                        CategoryFilter(label: 'Intermediate'),
                        SizedBox(width: 12),
                        CategoryFilter(label: 'Advanced'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Featured Workout Card
                  const FeaturedWorkoutCard(
                    title: 'Battle Rope Workout',
                    duration: '30 mins',
                    calories: '1450 cal',
                    exercises: 'Strength, Cardiovascular Endurance',
                    imageUrl: 'assets/images/intermediateexercise4.jpg',
                    isFavorite: false,
                  ),
                  const SizedBox(height: 24),

                  // Let's Go Beginner Section
                  const Text(
                    'Let\'s Go Intermediate',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Explore Different Workouts',
                    style: TextStyle(
                      color: Color(0xFF888888),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Workout Cards List
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const BicepCurlPage()));
                        },
                        child: WorkoutCard(
                          title: 'Bicep Curls',
                          duration: '20 min',
                          calories: '1000 cal',
                          exercises: 'Biceps',
                          imageUrl: 'assets/images/intermediateexercise1.jpeg',
                          isFavorite: false,
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const SplitSquatPage()));
                        },
                        child: WorkoutCard(
                          title: 'Bulgarian Split Squat',
                          duration: '30 min',
                          calories: '1450 cal',
                          exercises: 'Quads, Glutes',
                          imageUrl: 'assets/images/intermediateexercise2.jpg',
                          isFavorite: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const RopePage()));
                        },
                        child: WorkoutCard(
                          title: 'Battle Rope Workout',
                          duration: '30 min',
                          calories: '1450 cal',
                          exercises: 'Strength, Cardiovascular Endurance',
                          imageUrl: 'assets/images/intermediateexercise4.jpg',
                          isFavorite: true,
                        ),
                      ),
                      const SizedBox(height: 80), // Extra space for navigation bar
                    ],
                  ),
                ],
              ),
            ),

            // Bottom Navigation Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFF333333),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.home, color: Colors.white),
                    Icon(Icons.list, color: Colors.white),
                    Icon(Icons.star, color: Colors.white),
                    Icon(Icons.headphones, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryFilter extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryFilter({
    Key? key,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);

  void _navigateToCategory(BuildContext context) {
    switch (label.toLowerCase()) {
      case 'beginner':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkoutPage()));
        break;
      case 'intermediate':
        break;
      case 'advanced':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const HardWorkoutPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToCategory(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0xFF333333),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class FeaturedWorkoutCard extends StatelessWidget {
  final String title;
  final String duration;
  final String calories;
  final String exercises;
  final String imageUrl;
  final bool isFavorite;

  const FeaturedWorkoutCard({
    Key? key,
    required this.title,
    required this.duration,
    required this.calories,
    required this.exercises,
    required this.imageUrl,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Training of the Day badge
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Training Of The Day',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              if (isFavorite)
                const Positioned(
                  top: 16,
                  right: 56,
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                ),
            ],
          ),

          // Workout details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                // Using Column to stack the duration, calories, and exercises vertically
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Color(0xFF888888),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF888888),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          size: 16,
                          color: Color(0xFF888888),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          calories,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF888888),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.show_chart,
                          size: 16,
                          color: Color(0xFF888888),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          exercises,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF888888),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String duration;
  final String calories;
  final String exercises;
  final String imageUrl;
  final bool isFavorite;
  final bool showDetails;

  const WorkoutCard({
    Key? key,
    required this.title,
    required this.duration,
    required this.calories,
    required this.exercises,
    required this.imageUrl,
    required this.isFavorite,
    this.showDetails = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Workout details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Using Column to stack the duration, calories, and exercises vertically
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 16,
                                color: Color(0xFF888888),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                duration,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.local_fire_department,
                                size: 16,
                                color: Color(0xFF888888),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                calories,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.show_chart,
                                size: 16,
                                color: Color(0xFF888888),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                exercises,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (showDetails) ...[
                // Workout image
                Image.asset(
                  imageUrl,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ],
            ],
          ),

          // Favorite star icon
          if (isFavorite)
            const Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.star,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
