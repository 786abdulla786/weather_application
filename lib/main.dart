import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_new_application/homepage.dart';
import 'package:weather_new_application/location_provide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (context)=>LocationProvide())
      
      ],
      child: MaterialApp(
        title: 'Weather New App',
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
