import 'package:docsapp/auth/sign_up.dart';
import 'package:docsapp/misc/custom_text.dart';
import 'package:docsapp/screens/home.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: const Text('DocsApp', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),),
            const SizedBox(height: 20,),
            CustomTextField(
              controller: TextEditingController(), // Pass your TextEditingController here
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email),
              textStyle: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 20.0),
            CustomTextField(
              controller: TextEditingController(), // Pass your TextEditingController here
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock),
              isObscureText: true,
              textStyle: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Navigate to HomePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
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
                    //  Google login
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Image.asset('assets/images/google_logo.png'), // Provide the asset path for the Google logo
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //  Facebook login
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Image.asset('assets/images/facebook_logo.png'), // Provide the asset path for the Facebook logo
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>SignUpPage()),
                );
              },
              child: Text(
                'Don\'t have an account?',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
