import 'package:assignment4gobus/models/routeModel.dart';

List<RouteModel> getMockRoutes() {
  return [
    RouteModel(
      route: "City Express", 
      busNumber: "12", 
      stopName: "Main St Station", 
      time: "25 mins",
    ),
    RouteModel(
      route: "College Link", 
      busNumber: "45", 
      stopName: "University Gate", 
      time: "30 mins",
    ),
    RouteModel(
      route: "Downtown Loop", 
      busNumber: "7", 
      stopName: "Central Park", 
      time: "35 mins",
    ),
  ];
}