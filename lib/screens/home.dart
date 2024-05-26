import 'package:docsapp/folder/folder_page.dart';
import 'package:docsapp/folder_model.dart';
import 'package:docsapp/misc/more_options.dart';

import 'package:docsapp/screens/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListView = true;

  void _handleMoreOptions(String option) {
    switch (option) {
      case 'sort_az':
        print('Sort A -> Z selected');
        // Implement sorting logic here
        break;
      case 'sort_za':
        print('Sort Z -> A selected');
        // Implement sorting logic here
        break;
      case 'toggle_view':
        setState(() {
          isListView = !isListView;
        });
        print(isListView ? 'List View selected' : 'Grid View selected');
        // Implement view toggle logic here
        break;
    }
  }

  void _navigateToFolderPage(String folderName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FolderPage(folderName: folderName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, User'), // Fetch current user's name
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/man.png'),
            ), // Fetch user's avatar else give default images.
          ),
          MoreOptions(onSelected: _handleMoreOptions, isListView: isListView),
        ],
      ),
      drawer: MyDrawer(),
      body: isListView
          ? ListView.builder(
              itemCount: folders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(folders[index].icon),
                  title: Text(folders[index].name),
                  onTap: () {
                    _navigateToFolderPage(folders[index].name);
                  },
                );
              },
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: folders.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToFolderPage(folders[index].name);
                  },
                  child: GridTile(
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(folders[index].icon),
                            Text(folders[index].name),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
