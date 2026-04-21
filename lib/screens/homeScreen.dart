import 'package:flutter/material.dart';
import 'package:assignment4gobus/data/mockData.dart';
import 'package:assignment4gobus/models/routeModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final startController = TextEditingController();
  final destinationController = TextEditingController();

  List<RouteModel> activeBuses = [];
  bool hasSearched = false;

  @override
  void initState() {
    super.initState();
    activeBuses = getMockRoutes();
    debugPrint("GoBus: HomeScreen initialized"); // Logging
  }

  @override
  void dispose() {
    startController.dispose();  // ✅ Memory fix
    destinationController.dispose();
    super.dispose();
  }

  void handleSearch() {
    final start = startController.text.trim();
    final destination = destinationController.text.trim();

    // 🔐 SECURITY: Proper validation
    if (start.isEmpty || destination.isEmpty) {
      debugPrint("GoBus ERROR: Empty input");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both fields")),
      );
      return;
    }

    if (start == destination) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Start and destination cannot be same")),
      );
      return;
    }

    debugPrint("GoBus: Search triggered → $start to $destination");

    setState(() {
      hasSearched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GoBus"),
        backgroundColor: const Color(0xFF1565C0), // Brand Blue [cite: 42]
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Fields [cite: 27]
            TextField(
              controller: startController,
              decoration: const InputDecoration(labelText: "Start Location", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: destinationController,
              decoration: const InputDecoration(labelText: "Destination", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: handleSearch,
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
              child: const Text("Search"),
            ),
            const Divider(height: 30),
            const Text("Nearby Buses", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            // Results List [cite: 21, 36]
            Expanded(
              child: ListView.builder(
                itemCount: activeBuses.length,
                itemBuilder: (context, index) {
                  final bus = activeBuses[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.directions_bus, color: Color(0xFF1565C0)),
                      // If searched, show Name + Number. Otherwise just Name.
                      title: Text(hasSearched ? "${bus.route} (#${bus.busNumber})" : bus.route),
                      // If searched, show Stop Name. Otherwise just Time.
                      subtitle: Text(hasSearched ? "Stop: ${bus.stopName}" : "Arriving in ${bus.time}"),
                      trailing: hasSearched ? Text(bus.time, style: const TextStyle(color: Colors.green)) : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}