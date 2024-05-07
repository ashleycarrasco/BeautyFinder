import 'package:beautyfinder/resources/auth_methods.dart';
import 'package:beautyfinder/util/utils.dart';
import 'package:flutter/material.dart';
import '../widgets/text_field_input.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
  }

  void signUpUser() async {
    String result = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text);
    if (result != 'success') {
      showSnackBar(result, context);
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //arrow to go back
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 252, 250, 250),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Flexible(child: Container(), flex: 12),
              const SizedBox(height: 5),
              //app name
              const Text(
                'BeautyFinder',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),

              const SizedBox(height: 15),

              //logo
              const Icon(Icons.brush, size: 40, color: Colors.black),

              //spacing
              const SizedBox(height: 30),

              //email input
              TextFieldInput(
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),

              const SizedBox(height: 21),

              TextFieldInput(
                hintText: 'First Name',
                textInputType: TextInputType.text,
                textEditingController: _firstNameController,
              ),

              const SizedBox(height: 21),
              TextFieldInput(
                hintText: 'Last Name',
                textInputType: TextInputType.text,
                textEditingController: _lastNameController,
              ),

              const SizedBox(height: 21),
              TextFieldInput(
                hintText: 'Username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),

              const SizedBox(height: 21),
              TextFieldInput(
                hintText: 'Password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),

              const SizedBox(height: 21),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  width: double.infinity,
                  height: 47,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    )),
                    color: Color.fromARGB(255, 31, 30, 30),
                  ),
                ),
              ),

              const SizedBox(height: 21),
            ],
          ),
        ),
      ),
    );
  }
}
