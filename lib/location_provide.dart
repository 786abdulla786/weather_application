// import 'package:flutter/widgets.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather_new_application/location_service.dart';

// class LocationProvide with ChangeNotifier{

//   Position? _currentPosition;
//   Position? get currentPosition=> _currentPosition;

//   final LocationService _locationService=LocationService();
  
//   Placemark? _currentLocationName;
//   Placemark? get currentLocationName=>_currentLocationName;

//   String? weatherMain;

// double? currentTemp;

// double? tempMax;
// double? tempMin;

// String? sunrise;
// String? sunset;


//   Future<void>determinePosition()async{
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled=await Geolocator.isLocationServiceEnabled();

//     if(serviceEnabled){
//       _currentPosition=null;
//       notifyListeners();

//       return;
//     }

//     permission=await Geolocator.checkPermission();

//     if(permission==LocationPermission.denied){
//      permission=await Geolocator.requestPermission();
     
//       if(permission==LocationPermission.denied){
//         _currentPosition =null;
//         notifyListeners();
//         return;
//       }

//     }

//     if(permission==LocationPermission.deniedForever){
//       _currentPosition=null;
//       notifyListeners();
//       return;
//     }
//     _currentPosition=await Geolocator.getCurrentPosition();
//     print(_currentPosition);

//     _currentLocationName=await _locationService.getLocationName(_currentPosition);

//     notifyListeners();
//   }

// } 



import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_new_application/location_service.dart';

class LocationProvide with ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;
  
  final LocationService _locationService = LocationService();

  Placemark? _currentLocationName;
  Placemark? get currentLocationName => _currentLocationName;

  String? weatherMain;
  double? currentTemp;
  double? tempMax;
  double? tempMin;
  String? sunrise;
  String? sunset;
   //this is my API key 
  final String apiKey = 'dcb322e143c850c7595f1d5435b08f73';

  get forecast30Days => null; 


   Position? currentLocation;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    //  location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return Future.error('Location services are disabled.');
    }

    //  location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When permissions are granted, get the current position
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Get the placemark from coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation!.latitude, currentLocation!.longitude);

    if (placemarks.isNotEmpty) {
      _currentLocationName = placemarks.first;
    }

    notifyListeners();
  }




  // Get current location and fetch weather
  Future<void> determinePosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _currentPosition = null;
        notifyListeners();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _currentPosition = null;
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _currentPosition = null;
        notifyListeners();
        return;
      }

      _currentPosition = await Geolocator.getCurrentPosition();
      _currentLocationName = await _locationService.getLocationName(_currentPosition!);

      await fetchWeather(_currentPosition!.latitude, _currentPosition!.longitude);
    } catch (e) {
      print('Error determining position: $e');
    }
  }

  // Fetch weather by latitude and longitude
  Future<void> fetchWeather(double lat, double lon) async {
    try {
      final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _updateWeatherData(data);
      } else {
        throw Exception('Failed to load weather by location');
      }
    } catch (e) {
      print('Error fetching weather by location: $e');
    }
  }

  // Fetch weather by city name (Search)
  Future<void> fetchWeatherByCity(String cityName) async {
    try {
      final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _updateWeatherData(data);
        _currentLocationName = Placemark(locality: cityName);
      } else {
        throw Exception('City not found');
      }
    } catch (e) {
      print('Error fetching weather by city: $e');
    }
  }

  // Update weather data common method
  void _updateWeatherData(Map<String, dynamic> data) {
    try {
      weatherMain = data['weather'][0]['main'];
      currentTemp = data['main']['temp']?.toDouble();
      tempMax = data['main']['temp_max']?.toDouble();
      tempMin = data['main']['temp_min']?.toDouble();
      sunrise = _formatTimeFromTimestamp(data['sys']['sunrise']);
      sunset = _formatTimeFromTimestamp(data['sys']['sunset']);
      notifyListeners();
    } catch (e) {
      print('Error updating weather data: $e');
    }
  }

  // Convert timestamp to readable time
  String _formatTimeFromTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true).toLocal();
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

}