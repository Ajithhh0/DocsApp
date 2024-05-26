import 'package:flutter/material.dart';
import 'package:docsapp/misc/more_options.dart';

class FolderPage extends StatefulWidget {
  final String folderName;

  FolderPage({required this.folderName});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
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
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.folderName),
          actions: [
            MoreOptions(onSelected: _handleMoreOptions, isListView: isListView),
          ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24.0),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/man.png'),
              radius: 50.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'User',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 24.0),
            isListView ? _buildListView() : _buildGridView(), // Conditional rendering based on isListView
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5, // dummy files
        itemBuilder: (context, index) {
          final bool isPdf = index.isEven;
          final String fileName = isPdf ? 'passport.pdf' : 'license.jpg';
          final String iconPath = isPdf ? 'assets/images/pdf.png' : 'assets/images/image.png';

          return ListTile(
            leading: Image.asset(
              iconPath,
              width: 24.0,
              height: 24.0,
            ),
            title: Text(
              fileName,
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle file tap
              print('File ${index + 1} tapped');
            },
          );
        },
      ),
    );
  }

  Widget _buildGridView() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can adjust the cross axis count as per your requirement
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemCount: 5, // dummy files
        itemBuilder: (context, index) {
          final bool isPdf = index.isEven;
          final String fileName = isPdf ? 'passport.pdf' : 'license.jpg';
          final String iconPath = isPdf ? 'assets/images/pdf.png' : 'assets/images/image.png';

          return Container(
            child: InkWell(
              onTap: () {
                // Handle file tap
                print('File ${index + 1} tapped');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPath,
                    width: 64.0,
                    height: 64.0,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    fileName,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
