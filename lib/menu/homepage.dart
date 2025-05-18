/*Autored by:Jann Jasper Rosero and John Joseph Poller
Company:Padihon Corp.
Project: The GOL (Gym Of Legends)
Feature: Home Page
Description: A page that display recommendation   */ 

import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {

    const HomeScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            print("Search Clicked");
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications, color: Colors.blue),
                          onPressed: () {
                            print("Notifications Clicked");
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

              SizedBox(height: 20),

              // 🔹 Recommendations Section
              sectionHeader("Recommendations"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildRecommendationCard("Squat Exercise", 'images/unsplash.jpg'),
                  buildRecommendationCard("Full Body Stretching", 'images/unsplash.jpg'),
                ],
              ),

              SizedBox(height: 20),

              // 🔹 Weekly Challenge (Updated)
              buildWeeklyChallengeCard(),

              SizedBox(height: 20),

              // 🔹 Articles & Tips Section
              sectionHeader("Articles & Tips"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildArticleCard("Supplement Guide", 'images/unsplash.jpg'),
                  buildArticleCard("Effective Routines", 'images/unsplash.jpg'),
                ],
              ),

              SizedBox(height: 20), // Extra space at the bottom
            ],
          ),
        ),
      ),

      // 🔹 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: bottomNavIndex,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
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
      },
      child: Column(
        children: [
          Icon(icon,
              color: selectedIndex == index ? Colors.red : Colors.white,
              size: 30),
          SizedBox(height: 5),
          Text(title,
              style: TextStyle(
                  color: selectedIndex == index ? Colors.red : Colors.white)),
        ],
      ),
    );
  }
  
  // 🔹 Recommendation Card Widget
  Widget buildRecommendationCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        print("$title Clicked");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 150,
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset(imagePath, width: 100, height: 80, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // 🔹 Weekly Challenge Card
  Widget buildWeeklyChallengeCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          print("Weekly Challenge Clicked");
        },
        child: Container(
          padding: EdgeInsets.all(15),
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
              // Image on the Right
              Image.asset(
                'images/unsplash.jpg',
                width: 60, // Slightly bigger image
                height: 60,
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
        print("$title Clicked");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 150,
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset(imagePath, width: 100, height: 80, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}