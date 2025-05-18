import 'package:dagol/menu/homepage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THE G.O.L'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Welcome to Gym of Legends',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffff534d), // Text color
              ),
            ),
            SizedBox(height: 20),
            // Input fields container
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xffFF6565), // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Column(
                children: [
                  // Email input field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  // Password input field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  // Forgot password button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigate to Forgot Password page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Placeholder()),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign-Up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            // Sign-up redirection link
            TextButton(
              onPressed: () {
                // Navigate to Sign-Up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Placeholder()),
                );
              },
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(color: Colors.deepPurpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}