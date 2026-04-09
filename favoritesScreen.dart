import 'package:flutter/material.dart';
import 'package:assignment4gobus/screens/resultScreen.dart'; // Import to allow navigation

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // These represent the "Saved Routes" from your IA [cite: 25]
    final List<String> favs = ["Home", "College Campus", "Central Station"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: const Color(0xFF1565C0), // Consistent branding [cite: 42]
      ),
      body: ListView.builder(
        itemCount: favs.length,
        itemBuilder: (context, index) {
          return Card( // Using cards for spacing compliance [cite: 45, 131]
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.place, color: Color(0xFF1565C0)),
              title: Text(favs[index]),
              subtitle: const Text("Tap to see arriving buses"),
              trailing: const Icon(Icons.star, color: Colors.amber),
              // THE CLICK ACTION
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      start: "Current Location", // Assumption for Daniel [cite: 9]
                      destination: favs[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}