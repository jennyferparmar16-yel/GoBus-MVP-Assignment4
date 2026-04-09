class RouteModel {
  final String route;      // Bus Name
  final String busNumber;  // Bus Number
  final String stopName;   // Bus Stop Name
  final String time;       // Arrival Time

  RouteModel({
    required this.route,
    required this.busNumber,
    required this.stopName,
    required this.time,
  });
}