import 'package:docsapp/auth/sign_up.dart';
import 'package:docsapp/misc/custom_text.dart';
import 'package:docsapp/screens/home.dart';
import 'package:docsapp/screens/user_files.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  'DocsApp',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email),
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
                isObscureText: true,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Navigate to HomePage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Apple login
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.transparent,
                      child: Image.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? 'assets/images/apple_logo_white.png'
                            : 'assets/images/apple_logo.png',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Google login
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.transparent,
                      child: Image.asset(
                          'assets/images/google_logo.png'), // Provide the asset path for the Google logo
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Facebook login
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.transparent,
                      child: Image.asset(
                          'assets/images/facebook_logo.png'), // Provide the asset path for the Facebook logo
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
