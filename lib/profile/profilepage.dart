/*Autored by:Jann Jasper Rosero and John Joseph Poller
Company:Padihon Corp.
Project: The GOL (Gym Of Legends)
Feature: Profile
Description: A page that ask the user of physical activity level and 
displays user profile */ 

import 'package:flutter/material.dart';

// 🔹 Physical Activity Level Screen
class ActivityLevelScreen extends StatefulWidget {
  @override
  _ActivityLevelScreenState createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  String selectedLevel = ""; // Stores the selected level

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ Makes the screen scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Physical Activity Level",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Let us know how experienced and familiar you are in working out and maintaining diet",
                      style: TextStyle(color: Colors.white60),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    buildOption("Beginner"),
                    buildOption("Intermediate"),
                    buildOption("Advanced"),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedLevel.isNotEmpty
                            ? Colors.grey
                            : Colors.grey[800],
                      ),
                      onPressed: selectedLevel.isNotEmpty
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
                            }
                          : null,
                      child: Text("Continue"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption(String text) {
    bool isSelected = selectedLevel == text;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Colors.red
              : Colors.white, // White by default, turns red when clicked
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: () {
          setState(() {
            selectedLevel = text; // Store the selected level
          });
        },
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
    );
  }
}

// 🔹 Profile Screen (Editable Fields)
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ Makes the screen scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Fill Your Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),

                    //
                    Image.asset(
                      'assets/images/image6.png',
                      width: 100, //
                      height: 100,
                      fit: BoxFit.cover,
                    ),

                    SizedBox(height: 20),
                    buildTextField("Full Name", fullNameController),
                    buildTextField("Nickname", nicknameController),
                    buildTextField("Email", emailController),
                    buildTextField("Mobile Number", mobileController),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        // Handle start action
                      },
                      child: Text("Start"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          SizedBox(height: 5),
          TextField(
            controller: controller,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}