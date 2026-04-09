import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  // Constructor receives the global state [cite: 110, 118]
  const ProfileScreen({
    super.key, 
    required this.isDarkMode, 
    required this.onThemeChanged
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("Daniel Morris"), // Daniel Morris persona [cite: 5, 102]
            subtitle: Text("Age: 24 | Student"),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Switch between Black & White theme"),
            value: isDarkMode,
            onChanged: onThemeChanged, // This triggers the global setState
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About GoBus"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "GoBus MVP",
                applicationVersion: "1.0.0",
                applicationLegalese: "Assignment 4 Prototype",
              );
            },
          ),
        ],
      ),
    );
  }
}