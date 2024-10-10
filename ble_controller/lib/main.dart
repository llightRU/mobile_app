import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ble_controller.dart';
import 'device_screen.dart'; // Make sure to import the correct screens

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bluetooth Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bluetooth Devices'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BleController bleController = Get.put(BleController());

  // Boolean to track scanning state
  bool isScanning = false;

  // Toggle scan state
  void _toggleScan() {
    setState(() {
      if (isScanning) {
        // Stop scanning
        bleController.stopScan();
      } else {
        // Start scanning
        bleController.scanDevices();
      }
      isScanning = !isScanning;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: _toggleScan, // Call the toggle function
            style: ElevatedButton.styleFrom(
              backgroundColor: isScanning ? Colors.red : Colors.blue, // Change color based on scanning state
            ),
            child: Text(isScanning ? 'Stop Scanning' : 'Scan for Devices', style: const TextStyle(
              color: Colors.white,
            )), // Toggle text based on state
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: bleController.scannedDevices.length,
                itemBuilder: (context, index) {
                  final device = bleController.scannedDevices[index];
                  return Card(
                    child: ListTile(
                      subtitle: Text(device.device.remoteId.toString()),
                      title: Text(device.advertisementData.advName ?? 'Unknown Device'),
                      onTap: () {
                        // Navigate to Device Details Screen on tap
                        Get.to(() => DeviceScreen(device: device.device));
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
