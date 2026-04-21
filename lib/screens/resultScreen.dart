import 'package:flutter/material.dart';
import 'package:assignment4gobus/data/mockData.dart';
import 'package:assignment4gobus/models/routeModel.dart';

class ResultScreen extends StatefulWidget {
  final String start;
  final String destination;

  const ResultScreen({
    super.key,
    required this.start,
    required this.destination,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<RouteModel> routes = [];
  RouteModel? selectedRoute;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadRoutes();
  }

  void loadRoutes() async {
  debugPrint("GoBus: Loading routes...");

  try {
    await Future.delayed(const Duration(seconds: 2));

    final fetchedRoutes = getMockRoutes();

    if (!mounted) return;

    setState(() {
      routes = fetchedRoutes;
      isLoading = false;
    });

    debugPrint("GoBus: Routes loaded successfully");
  } catch (e) {
    debugPrint("GoBus ERROR: Failed to load routes");

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }
}

 void selectRoute(RouteModel route) {
  debugPrint("GoBus: Route selected → ${route.route}");

  setState(() {
    selectedRoute = route;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route Options")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${widget.start} → ${widget.destination}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            if (isLoading)
              const Center(child: CircularProgressIndicator()) // System Feedback [cite: 180]
            else
              Expanded(
                child: ListView.builder(
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                    final route = routes[index];
                    return Card(
                      child: ListTile(
                        title: Text(route.route),
                        subtitle: Text(route.time),
                        onTap: () => selectRoute(route),
                      ),
                    );
                  },
                ),
              ),
            if (selectedRoute != null)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Trip Summary", // Final Task Flow [cite: 15, 20]
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Route: ${selectedRoute!.route}"),
                    Text("Time: ${selectedRoute!.time}"),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}