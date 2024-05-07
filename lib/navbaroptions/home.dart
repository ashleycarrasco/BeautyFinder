import 'package:beautyfinder/pages/intro_page.dart';
import 'package:beautyfinder/util/user_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'BeautyFinder',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.brush,
                    size: 30,
                    color: Colors.black,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IntroPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.logout_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Image.network(
                'https://i.pinimg.com/736x/f7/ba/b8/f7bab82455b7b3c06ecb775ba27fe1bd.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Image.network(
                'https://i.pinimg.com/564x/77/bc/f9/77bcf965bde30e9c9e48a610230f22f4.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Image.network(
                'https://i.pinimg.com/736x/b9/fb/54/b9fb5431769f1215408823aa14c9e6b4.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
