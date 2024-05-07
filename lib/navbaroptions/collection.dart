import 'package:flutter/material.dart';

class UserCollection extends StatelessWidget {
  const UserCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 250, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            SizedBox(
              width: 380,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 160, 157, 157),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: const Center(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                    child: Image.network(
                      'https://i.pinimg.com/564x/3c/c0/ea/3cc0ea3f4cd8a725264e9d878a360594.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
