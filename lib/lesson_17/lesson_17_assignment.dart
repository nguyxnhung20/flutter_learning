import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WeatherHomeScreen(),
    );
  }
}

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> weatherItems = [
      {
        "city": "Hà Nội",
        "time": "14:30",
        "weatherType": "Nắng nhẹ",
        "temperature": 32.0,
        "iconPath": "assets/svg/night_icon.svg",
      },
      {
        "city": "Hồ Chí Minh",
        "time": "15:00",
        "weatherType": "Mưa rào",
        "temperature": 28.5,
        "iconPath": "assets/svg/night_icon.svg",
      },
      {
        "city": "Đà Nẵng",
        "time": "14:45",
        "weatherType": "Nhiều mây",
        "temperature": 30.0,
        "iconPath": "assets/svg/night_icon.svg",
      },
      {
        "city": "Huế",
        "time": "14:40",
        "weatherType": "Nắng ấm",
        "temperature": 29.5,
        "iconPath": "assets/svg/night_icon.svg",
      },
      {
        "city": "Nha Trang",
        "time": "15:15",
        "weatherType": "Nắng và gió",
        "temperature": 31.0,
        "iconPath": "assets/svg/night_icon.svg",
      },
      {
        "city": "Cần Thơ",
        "time": "15:10",
        "weatherType": "Mưa nhỏ",
        "temperature": 27.5,
        "iconPath": "assets/svg/night_icon.svg",
      },
      {
        "city": "Đà Lạt",
        "time": "14:50",
        "weatherType": "Sương mù",
        "temperature": 22.0,
        "iconPath": "assets/svg/night_icon.svg",
      },
      {
        "city": "Hải Phòng",
        "time": "14:35",
        "weatherType": "Nắng gián đoạn",
        "temperature": 29.0,
        "iconPath": "assets/svg/night_icon.svg",
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: weatherItems.length,
            itemBuilder: (context, index) {
              final item = weatherItems[index];
              return WeatherItem(
                city: item["city"],
                time: item["time"],
                weatherType: item["weatherType"],
                temperature: item["temperature"],
                iconPath: item["iconPath"],
              );
            },
          ),
        ),
      ),
    );
  }
}

class WeatherItem extends StatelessWidget {
  final String city;
  final String time;
  final String weatherType;
  final double temperature;
  final String iconPath;

  const WeatherItem({
    Key? key,
    required this.city,
    required this.time,
    required this.weatherType,
    required this.temperature,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SectionOneInRow(city: city, time: time, weatherType: weatherType),
          SectionTwoInRow(iconPath: iconPath, temperature: temperature)
        ],
      ),
    );
  }
}

class SectionOneInRow extends StatelessWidget {
  final String city;
  final String time;
  final String weatherType;

  const SectionOneInRow({
    Key? key,
    required this.city,
    required this.time,
    required this.weatherType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          weatherType,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class SectionTwoInRow extends StatelessWidget {
  final String iconPath;
  final double temperature;

  const SectionTwoInRow({
    Key? key,
    required this.iconPath,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 100,
          height: 50,
          color: Colors.white,
        ),
        const SizedBox(height: 8),
        Text(
          "${temperature.toStringAsFixed(1)}°C",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
