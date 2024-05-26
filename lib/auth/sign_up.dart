import 'package:docsapp/auth/sign_in.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        leading: IconButton( // Add this leading property
          icon: Icon( Icons.arrow_back,
            color:Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInPage()), // Navigate to SignInPage
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSignUpOption(
              context,
              'Sign Up with Email',
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/images/email_white.png'
                  : 'assets/images/email_black.png',
            ),
            SizedBox(height: 20.0),
            buildSignUpOption(
              context,
              'Sign Up with Apple',
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/images/apple_logo_white.png'
                  : 'assets/images/apple_logo.png',
            ),
            SizedBox(height: 20.0),
            buildSignUpOption(
              context,
              'Sign Up with Google',
              'assets/images/google_logo.png',
            ),
            SizedBox(height: 20.0),
            buildSignUpOption(
              context,
              'Sign Up with Facebook',
              'assets/images/facebook_logo.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignUpOption(BuildContext context, String title, String logoPath) {
    return GestureDetector(
      onTap: () {
        // Handle sign up option
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).scaffoldBackgroundColor, // Use scaffold background color
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, // Use white border for dark theme, black for light theme
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              logoPath,
              width: 50,
              height: 50,
            ),
            SizedBox(width: 20.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
