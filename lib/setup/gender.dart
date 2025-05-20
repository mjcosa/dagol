import 'package:dagol/setup/age.dart';
import 'package:flutter/material.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen>
    with TickerProviderStateMixin {
  String selectedGender = '';
  late AnimationController _maleController;
  late AnimationController _femaleController;

  @override
  void initState() {
    super.initState();

    _maleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 1.0,
      upperBound: 1.1,
    );

    _femaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 1.0,
      upperBound: 1.1,
    );
  }

  @override
  void dispose() {
    _maleController.dispose();
    _femaleController.dispose();
    super.dispose();
  }

  void _onGenderTap(String gender) {
    setState(() {
      selectedGender = gender;
    });

    if (gender == 'Male') {
      _maleController.forward().then((_) => _maleController.reverse());
    } else {
      _femaleController.forward().then((_) => _femaleController.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 🔙 Back button
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.red),
                        SizedBox(width: 5),
                        Text("Back", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🏷️ Header text
            const Text(
              "What's Your Gender",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.redAccent,
              child: const Text(
                "For us to know what the best exercises and workout routine for you",
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),

            Column(
              children: [
                ScaleTransition(
                  scale: _maleController,
                  child: GestureDetector(
                    onTap: () => _onGenderTap('Male'),
                    child: GenderOption(
                      icon: Icons.male,
                      label: "Male",
                      backgroundColor: Colors.purpleAccent,
                      isSelected: selectedGender == 'Male',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ScaleTransition(
                  scale: _femaleController,
                  child: GestureDetector(
                    onTap: () => _onGenderTap('Female'),
                    child: GenderOption(
                      icon: Icons.female,
                      label: "Female",
                      backgroundColor: Colors.pinkAccent,
                      isSelected: selectedGender == 'Female',
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const AgeSelectionScreen()));                  },
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

class GenderOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final bool isSelected;

  const GenderOption({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: Colors.white, width: 4)
                : null,
          ),
          child: Icon(icon, color: Colors.black, size: 70),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
