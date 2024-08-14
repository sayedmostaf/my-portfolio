import 'package:flutter/material.dart';
import 'package:my_portfolio/views/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home
          // bucket: bucket,
          : PageStorage(
        bucket: bucket,
        child: const MainDashBoard(),
      ),
    );
  }
}
