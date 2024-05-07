import 'package:beautyfinder/resources/auth_methods.dart';
import 'package:beautyfinder/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/text_field_input.dart';
import 'home_page.dart';
import 'sign_up_page.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void logInUser() async {
    String result = await AuthMethods().logInUser(
        email: _emailController.text, password: _passwordController.text);

    if (result == "success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      showSnackBar(result, context);
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
              const SizedBox(height: 15),
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
              const SizedBox(height: 60),

              //username input
              TextFieldInput(
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
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
                onTap: logInUser,
                child: Container(
                  child: const Text(
                    'Log in',
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
              const Text(
                'OR',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),

              //Flexible(child: Container(), flex: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Container(
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
