import 'package:flutter/material.dart';
import 'enter_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 250, 250),
      body: Center(
        child: Column(
          children: [
            //spacing
            const SizedBox(height: 100),

            //title
            const Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),

            const Text(
              'To',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),

            const Text(
              'BeautyFinder',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),

            //subtitle
            const SizedBox(height: 20),

            const Text(
              'Skincare, Makeup, Fragrance',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 5),

            //subtitle
            const Text(
              'Your Favorite Beauty Products In One Place',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 120),

            //button to continue
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnterPage(),
                ),
              ),
              child: SizedBox(
                  width: 380,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
