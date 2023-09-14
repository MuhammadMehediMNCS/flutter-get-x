import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state_management/screen/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Get-X Provider'),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          color: Colors.deepPurple,
          child: SizedBox(
            height: 100.0,
            width: 150.0,
            child: Center(
              child: Obx(() => Text(
                  homeController.number.toString(),
                  style: const TextStyle(fontSize: 44, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.add),
        onPressed: () {
          homeController.increment();
        }
      ),
    );
  }
}