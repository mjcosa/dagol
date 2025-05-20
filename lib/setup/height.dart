import 'package:dagol/setup/weight.dart';
import 'package:flutter/material.dart';

class HeightSelectionScreen extends StatefulWidget {
  const HeightSelectionScreen({super.key});

  @override
  State<HeightSelectionScreen> createState() => _HeightSelectionScreenState();
}

class _HeightSelectionScreenState extends State<HeightSelectionScreen> {
  final PageController _pageController =
      PageController(viewportFraction: 0.25, initialPage: 80); // 180 cm roughly centered
  int selectedHeight = 180;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        selectedHeight = _pageController.page!.round() + 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Entire screen background
      body: SafeArea(
        child: Column(
          children: [
            // 🔙 Back Button
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(width: 5),
                        Text("Back", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // 🏷️ Title
            const Text(
              "How Tall Are You?",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 60),

            // 🔢 Selected Height
            Text(
              "$selectedHeight cm",
              style: const TextStyle(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Icon(Icons.arrow_drop_up, color: Colors.white, size: 30),

            const SizedBox(height: 10),

            // 🎡 Height Picker in Red Container
            Container(
              height: 100,
              color: Colors.red[400], // Red background only here
              child: PageView.builder(
                controller: _pageController,
                itemCount: 121, // heights 100 to 220
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    selectedHeight = index + 100;
                  });
                },
                itemBuilder: (context, index) {
                  final height = index + 100;
                  final isSelected = height == selectedHeight;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    alignment: Alignment.center,
                    width: isSelected ? 90 : 70,
                    child: Text(
                      '$height',
                      style: TextStyle(
                        fontSize: isSelected ? 32 : 24,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.white : Colors.white70,
                      ),
                    ),
                  );
                },
              ),
            ),

            const Spacer(),

            // ✅ Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => WeightSelectionScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("Continue", style: TextStyle(fontSize: 16)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
