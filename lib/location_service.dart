// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationService {

// Future<Placemark?> getLocationName(Position?Position)async{


//   if(Position!=null){

//     try{

//       final Placemarks=await placemarkFromCoordinates(
//         Position.latitude, Position.longitude
//         );

//         if(Placemarks.isNotEmpty){
//           return Placemarks[0];
//         }


//     }catch(e){
//       print("Error location name");
//     }

//     return null;


//   }
//   return null;
// }

// }

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  /// Fetches the first available Placemark (city, state, country) based on [position].
  Future<Placemark?> getLocationName(Position? position) async {
    if (position != null) {
      try {
        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          return placemarks.first;
        }
      } catch (e) {
        print("Error fetching location name: $e");
      }
    }
    return null;
  }

  /// Optional: Fetches a user-friendly address string (e.g., "City, Country") directly.
  Future<String?> getFormattedAddress(Position? position) async {
    if (position != null) {
      try {
        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          final Placemark place = placemarks.first;
          String city = place.locality ?? '';
          String country = place.country ?? '' ;
          return "$city, $country";
        }
      } catch (e) {
        print("Error fetching formatted address: $e");
      }
    }
    return null;
  }
}
