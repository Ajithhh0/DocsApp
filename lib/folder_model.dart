import 'package:flutter/material.dart';

class Folder {
  final String name;
  final IconData icon;

  Folder({required this.name, required this.icon});
}

List<Folder> folders = [
  Folder(name: 'Personal', icon: Icons.folder),
  Folder(name: 'Group 1', icon: Icons.folder),
  Folder(name: 'Family', icon: Icons.folder),
];
