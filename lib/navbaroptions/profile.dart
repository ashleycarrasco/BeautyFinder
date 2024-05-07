import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 250, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text('@ashleyc'),
            Text('#1 Product Brand: Pixi'),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/1c/43/4d/1c434d1640f9572e2ac7be5c6bac9348.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
