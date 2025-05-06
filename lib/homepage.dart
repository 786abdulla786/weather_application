// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weather_new_application/image_path.dart';
// import 'package:weather_new_application/location_provide.dart';


// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {

//   @override
//   void initState(){
//     Provider.of<LocationProvide>(context,listen: false).determinePosition();
//    super.initState();
//   }

//   bool clicked=false;
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;

//     final locationProvide=Provider.of<LocationProvide>(context);
    


//     return Scaffold(
      
//       // appBar: AppBar(
//       //   title: Text('Weather Application'),
//       //   backgroundColor: const Color.fromARGB(255, 37, 58, 84),
//       // ),
//       body: Container(
//         height: size.height,
//         width: size.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage(backGround[0]))
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(35.0),
//           child: Stack(
//             children: [

//            clicked==true?    Padding(
//                  padding: const EdgeInsets.only(top: 55),
//                  child: Align(
//                   alignment: Alignment.topCenter,
//                    child: Container(
//                     height: 45,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white)
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white)
//                         )
//                       ),
//                     ),
//                    ),
//                  ),
//                ):
//                SizedBox.shrink(),

//              Container(
//               height: 50,
//               child: Consumer<LocationProvide>(

//                 builder: (context,LocationProvide,child){
//                  var locationCity;
//                  if(locationProvide.currentLocationName!=null){
//                   locationCity = LocationProvide.currentLocationName!.locality;

//                  }else{
//                   locationCity='Do not location';
//                  }
//                   //final locationCity=locationProvide.currentLocationName!.locality??"not a location";
                  
//                   return ListTile(
//               leading: Icon(Icons.location_on_outlined,color: Colors.red,),

//               title: Text(locationCity,

//               style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),),
//               subtitle: Text('Good Morning',style: TextStyle(color: Colors.white),),
//               trailing: IconButton(onPressed: (){
//                 setState(() {
//                   clicked=!clicked;
//                 });
//               },
//                icon: Icon(Icons.search,color: Colors.white,),),
//              ) ;
//                 }
//                 ),
//              ),

             
//              Padding(
//                padding: const EdgeInsets.only(top: 100),
//                child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Image.asset(iconimage[3],width: 150,)
//                 ),
//              ),
//              Align(
//               alignment:Alignment(0, 0) ,
//                child: Container(
//                 height: 130,
              
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('26 C',style: TextStyle(color: Colors.white,fontSize: 21),),
//                    Text('Strom',style: TextStyle(color: Colors.white,fontSize: 21),),
//                    Text(DateTime.now().toString(),style: TextStyle(color: Colors.white),),
//                   ],
//                 ),
//                ),
//              ),
            
//             Align(
//               alignment: Alignment(0.0, 0.75),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.black.withAlpha(75)
//                 ),
//                 height: 180,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           children: [
//                             Image.asset('asset/image/temp1.png',height: 65,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('Temp Max',style:TextStyle(color: Colors.white,) ,),
//                                 Text('21 C',style:TextStyle(color: Colors.white,) ,)
                        
//                               ],
//                             )
//                           ],
//                         ),
//                          Row(
//                           children: [
//                             Image.asset('asset/image/temmin2.png',height: 65,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('Temp Min',style:TextStyle(color: Colors.white,) ,),
//                                 Text('21 C',style:TextStyle(color: Colors.white,) ,)
                        
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),

//                     Divider(
//                       indent: 20,
//                       endIndent: 20,
//                       color: Colors.white,
//                       thickness: 2,
//                     ),

//                      Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: [
//                          Row(
//                               children: [
//                                 Image.asset('asset/image/sunrise2.png',height: 65,),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Sunrise',style:TextStyle(color: Colors.white,) ,),
//                                     Text('21 C',style:TextStyle(color: Colors.white,) ,)
                            
//                                   ],
//                                 )
//                               ],
//                             ),
//                              Row(
//                           children: [
//                             Image.asset('asset/image/sunset1.png',height: 65,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('Sunset',style:TextStyle(color: Colors.white,) ,),
//                                 Text('21 C',style:TextStyle(color: Colors.white,) ,)
                        
//                               ],
//                             )
//                           ],
//                         ),
//                        ],
//                      ),
//                   ],
//                 ),
//               ),
//             )

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_new_application/image_path.dart';
import 'package:weather_new_application/location_provide.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  bool clicked = false;
  bool showForecast = false;

  List<Map<String, dynamic>> oneMonthForecast = List.generate(30, (index) {
    DateTime date = DateTime.now().add(Duration(days: index));
    String formattedDay = DateFormat('EEEE').format(date); // Monday, Tuesday...
    String formattedMonth = DateFormat('MMMM').format(date); // January, February...
    return {
      "day": formattedDay,
      "date": "${date.day} $formattedMonth",
      "temp": (20 + index % 10).toDouble(),
      "humidity": (50 + index % 30),
      "icon": "asset/image/sunny.png",
    };
  });

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<LocationProvide>(context, listen: false).determinePosition();
    });
  }

  String getBackgroundImage(String weatherMain) {
    switch (weatherMain) {
      case "Clear":
        return backGround[0];
      case "Rain":
        return backGround[1];
      case "Clouds":
        return backGround[2];
      case "Snow":
        return backGround[3];
      case "Thunderstorm":
        return backGround[4];
      case "Drizzle":
        return backGround[5];
      case "Mist":
        return backGround[6];
      default:
        return backGround[0];
    }
  }

  String getWeatherIcon(String weatherMain) {
    switch (weatherMain) {
      case "Clear":
        return iconimage[0];
      case "Rain":
        return iconimage[1];
      case "Clouds":
        return iconimage[2];
      case "Snow":
        return iconimage[3];
      case "Thunderstorm":
        return iconimage[4];
      case "Drizzle":
        return iconimage[5];
      case "Mist":
        return iconimage[6];
      default:
        return iconimage[0]; 
    }
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final locationProvide = Provider.of<LocationProvide>(context);
    final provider = Provider.of<WeatherProvider>(context);
  // ignore: unused_local_variable
  final label = provider.isUsingDeviceLocation
      ? "Current Location Weather"
      : "Weather for Searched Location";
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              getBackgroundImage(locationProvide.weatherMain ?? ""),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Stack(
            children: [
              // City search bar
              if (clicked)
                Padding(
                  padding: const EdgeInsets.only(top: 55),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            child: TextFormField(
                              controller: searchController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search city...',
                                hintStyle: TextStyle(color: Colors.white54),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              onFieldSubmitted: (value) async {
                                if (value.isNotEmpty) {
                                  await locationProvide.fetchWeatherByCity(value);
                                  setState(() {
                                    clicked = false;
                                    searchController.clear();
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              clicked = false;
                              searchController.clear();
                            });
                          },
                          icon: Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

              // City name + greeting + search button
              Container(
  height: 50,
  child: Consumer<LocationProvide>(
    builder: (context, locationProvide, child) {
      String locationCity =
          locationProvide.currentLocationName?.locality ?? 'No location';
      return ListTile(
        leading:IconButton(
  onPressed: () async {
    await locationProvide.getCurrentLocation();

    if (locationProvide.currentLocation != null) {
      final lat = locationProvide.currentLocation!.latitude;
      final lon = locationProvide.currentLocation!.longitude;

      // Fetch normal weather data
      Provider.of<WeatherProvider>(context, listen: false)
          .fetchWeatherByCoordinates(lat, lon);

      // Show weather map
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherMapScreen(
            latitude: lat,
            longitude: lon,
          ),
        ),
      );
    }
  },
  icon: const Icon(Icons.location_on_outlined, color: Colors.red),
),

        title: Text(
          locationCity,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          greeting(),
          style: TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              clicked = true;
            });
          },
          icon: Icon(Icons.search, color: Colors.white),
        ),
      );
    },
  ),
),


              // Weather Icon
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    getWeatherIcon(locationProvide.weatherMain ?? ""),
                    width: 150,
                  ),
                ),
              ),

              // Temperature and Main Weather
              Align(
                alignment: Alignment(0, 0),
                child: Container(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${locationProvide.currentTemp?.toStringAsFixed(0) ?? "--"}°C",
                        style: TextStyle(color: Colors.black, fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        locationProvide.weatherMain ?? "Loading...",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      Text(
                        "${DateFormat('dd MMMM yyyy – HH:mm').format(DateTime.now())}",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Info Box
              Align(
                alignment: Alignment(0.0, 0.75),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withAlpha(75),
                  ),
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Image.asset('asset/image/temp1.png', height: 65),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Temp Max', style: TextStyle(color: Colors.white)),
                                  Text('${locationProvide.tempMax?.toStringAsFixed(0) ?? "--"}°C',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('asset/image/temmin2.png', height: 65),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Temp Min', style: TextStyle(color: Colors.white)),
                                  Text('${locationProvide.tempMin?.toStringAsFixed(0) ?? "--"}°C',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Image.asset('asset/image/sunrise2.png', height: 65),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Sunrise', style: TextStyle(color: Colors.white)),
                                  Text(locationProvide.sunrise ?? "--", style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('asset/image/sunset1.png', height: 65),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Sunset', style: TextStyle(color: Colors.white)),
                                  Text(locationProvide.sunset ?? "--", style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
                
                
              // Forecast Toggle Button
              Padding(
                padding: const EdgeInsets.only(top: 470),
                child: Align(
                  alignment: Alignment(0.0, 0.95),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      setState(() {
                        showForecast = !showForecast;
                      });
                    },
                    child: Text(showForecast ? "Hide 1 Month Forecast" : "Show 1 Month Forecast"),
                  ),
                ),
              ),

              // Forecast List
              if (showForecast)
                Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 250,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: oneMonthForecast.length,
                      itemBuilder: (context, index) {
                        var item = oneMonthForecast[index];
                        return Container(
                          width: 130,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withBlue(85),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item["day"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text(item["date"], style: TextStyle(color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 8),
                              Image.asset(item["icon"], height: 40),
                              SizedBox(height: 8),
                              Text("${item["temp"]}°C", style: TextStyle(color: Colors.white)),
                              Text("${item["humidity"]}%", style: TextStyle(color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
             ],
          ),
        ),
      ),
    );
  }
}


class WeatherMapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  const WeatherMapScreen({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const apiKey = 'dcb322e143c850c7595f1d5435b08f73'; // your API key

    return Scaffold(
      appBar: AppBar(title: const Text("Weather Map")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(latitude, longitude),
          initialZoom: 6.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            tileProvider: NetworkTileProvider(),
            additionalOptions: const {
              'userAgentPackageName': 'com.example.weatherapp',
            },
          ),
          TileLayer(
            urlTemplate:
                "https://tile.openweathermap.org/map/clouds_new/{z}/{x}/{y}.png?appid=$apiKey",
            tileProvider: NetworkTileProvider(),
            additionalOptions: const {
              'userAgentPackageName': 'com.example.weatherapp',
            },
             tileBuilder: (context, tileWidget, tile) {
              return Opacity(opacity: 0.6, child: tileWidget);
            },
          ),
        ],
      ),
    );
  }
}




class WeatherProvider extends ChangeNotifier {
  Map<String, dynamic>? _weather;
  Map<String, dynamic>? get weather => _weather;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  double? _latitude;
  double? _longitude;
  bool _isUsingDeviceLocation = false;

  double? get latitude => _latitude;
  double? get longitude => _longitude;
  bool get isUsingDeviceLocation => _isUsingDeviceLocation;

  /// Fetch weather from coordinates (e.g., search or manual input)
  Future<void> fetchWeatherByCoordinates(double lat, double lon, {bool fromDevice = false}) async {
    try {
      _isLoading = true;
      notifyListeners();

      final data = await WeatherService().fetchWeather(lat, lon);
      _weather = data;
      _latitude = lat;
      _longitude = lon;
      _isUsingDeviceLocation = fromDevice;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print("Failed to fetch weather: $e");
    }
  }

  /// Clear state if needed
  void clearWeather() {
    _weather = null;
    _latitude = null;
    _longitude = null;
    _isUsingDeviceLocation = false;
    notifyListeners();
  }
}


class WeatherService {
  final String apiKey = 'dcb322e143c850c7595f1d5435b08f73'; // your API key

  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
