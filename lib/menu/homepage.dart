/*Autored by:Jann Jasper Rosero and John Joseph Poller
Company:Padihon Corp.
Project: The GOL (Gym Of Legends)
Feature: Home Page
Description: A page that display recommendation   */ 

import 'package:dagol/workout/components/pages/easy/pullup.dart';
import 'package:dagol/workout/components/pages/inter/rope.dart';
import 'package:dagol/workout/components/pages/inter/splitsquat.dart';
import 'package:dagol/workout/workouts.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {

    const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = -1; // Stores the clicked item index
  int bottomNavIndex = 0; // Default selected bottom navigation item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView( // Makes content scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header with Search & Notification Icons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, Padi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("It's time to challenge your limits.",
                            style: TextStyle(color: Colors.white60)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.blue),
                          onPressed: () {
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications, color: Colors.blue),
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 🔹 Top Navigation Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNavItem(context, "Workout", Icons.fitness_center, 0),
                  buildNavItem(context, "Progress", Icons.show_chart, 1),
                  buildNavItem(context, "Nutrition", Icons.restaurant, 2),
                  buildNavItem(context, "Community", Icons.people, 3),
                ],
              ),

              SizedBox(height: 30),

              // 🔹 Recommendations Section
              sectionHeader("Recommendations"),
              SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    buildRecommendationCard("Squat Exercise", 'images/unsplash.jpg'),
                    buildRecommendationCard("Full Body Stretching", 'assets/images/easyexercise7.jpg'),
                    buildRecommendationCard("Power Exercise", 'assets/images/hardexercise1.jpeg'),
                    buildRecommendationCard("Push Day Routine", 'assets/images/routines.jpg'),
                  ],
                ),
              ),


              SizedBox(height: 20),

              // 🔹 Weekly Challenge (Updated)
              buildWeeklyChallengeCard(),

              SizedBox(height: 20),

              // 🔹 Articles & Tips Section
              sectionHeader("Articles & Tips"),
              SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    buildArticleCard("Supplement Guide", 'assets/images/nutrition.jpg'),
                    buildArticleCard("Effective Routines", 'assets/images/routines.jpg'),
                    buildArticleCard("Fitness Routine", 'assets/images/intermediateexercise2.jpeg'),
                    buildArticleCard("Posture Tips", 'assets/images/easyexercise7.jpg'),
                  ],
                ),
              ),


              SizedBox(height: 20), // Extra space at the bottom
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: bottomNavIndex,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });

          // Navigate to corresponding screen
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Placeholder()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Placeholder()),
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

    );
  }

  // 🔹 Section Header Widget
  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(title,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  // 🔹 Navigation Icon Widget
  Widget buildNavItem(BuildContext context, String title, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        // Navigate to corresponding screen
        Widget targetScreen;
        switch (index) {
          case 0:
            targetScreen = WorkoutPage();
            break;
          case 1:
            targetScreen = Placeholder();
            break;
          case 2:
            targetScreen = Placeholder();
            break;
          case 3:
            targetScreen = Placeholder();
            break;
          default:
            return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Column(
        children: [
          Icon(icon,
              color: Colors.white,
              size: 30),
          SizedBox(height: 5),
          Text(title,
              style: TextStyle(
                  color: Colors.white)),
        ],
      ),
    );
  }

  
  // 🔹 Recommendation Card Widget
  Widget buildRecommendationCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplitSquatPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 200, // Increased size
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 200, height: 120, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }


  // 🔹 Weekly Challenge Card
  Widget buildWeeklyChallengeCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RopePage()),
        );
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Weekly Challenge Text
              Text(
                "Weekly Challenge",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'images/unsplash.jpg',
                width: 65, 
                height: 65,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Article Card Widget
  Widget buildArticleCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PullUpPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 200, height: 120, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}