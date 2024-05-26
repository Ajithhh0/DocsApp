import 'package:flutter/material.dart';

class MoreOptions extends StatelessWidget {
  final Function onSelected;
  final bool isListView;

  MoreOptions({required this.onSelected, required this.isListView});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        onSelected(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'sort_az',
          child: Text('Sort A - Z'),
        ),
        const PopupMenuItem<String>(
          value: 'sort_za',
          child: Text('Sort Z - A'),
        ),
        PopupMenuItem<String>(
          value: 'toggle_view',
          child: Text(isListView ? 'Grid View' : 'List View'),
        ),
      ],
    );
  }
}
