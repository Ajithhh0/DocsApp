import 'package:docsapp/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:docsapp/screens/drawer.dart';
import 'dart:ui'; // Importing dart:ui for ImageFilter

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _menuKey = GlobalKey();

  bool _isMenuOpen = false;

  void _showMenu() async {
    final RenderBox button = _menuKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);

    setState(() {
      _isMenuOpen = true;
    });

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + button.size.height,
        position.dx + button.size.width,
        0.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      items: [
        PopupMenuItem(
          value: 'account',
          child: Text('Account settings'),
        ),
        PopupMenuItem(
          value: 'signout',
          child: Text('Sign out'),
        ),
      ],
    ).then((value) {
      setState(() {
        _isMenuOpen = false;
      });

      if (value != null) {
        if (value == 'account') {
          // Navigate to account settings
        } else if (value == 'signout') {
          Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                title: const Text('Welcome, User'), // Fetch current user's name
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      key: _menuKey,
                      onTap: _showMenu,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/man.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Theme.of(context).appBarTheme.backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        
                      },
                      color: Theme.of(context).iconTheme.color,
                    ),
                    IconButton(
                      icon: const Icon(Icons.file_upload),
                      onPressed: () {
                        // Handle upload action
                      },
                      color: Theme.of(context).iconTheme.color,
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {
                        // Handle camera action
                      },
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('Upload files and get started!'),
                ),
              ),
            ],
          ),
          if (_isMenuOpen)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
