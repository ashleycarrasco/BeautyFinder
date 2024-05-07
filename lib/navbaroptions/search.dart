import 'package:flutter/material.dart';

class UserSearch extends StatelessWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 250, 250),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            SizedBox(
              width: 380,
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 160, 157, 157),
                  borderRadius: BorderRadius.circular(8),
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
            const SizedBox(height: 15),
            Image.network(
              'https://i.pinimg.com/564x/94/bc/43/94bc433e6c710a313c5661fa691d7bb6.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://i.pinimg.com/736x/3e/23/87/3e238748e9e000a062ba625a25c89b1f.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://i.pinimg.com/564x/2a/46/35/2a46351dc6d1ef988e8322e6d77f04b8.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
