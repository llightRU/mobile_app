import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  late StreamSubscription<List<ScanResult>> _scanResultsSubscription;
  var scannedDevices = <ScanResult>[].obs;
  var isScanning = false.obs; // Observable to track scanning state

  @override
  void onInit() {
    super.onInit();
    _checkBluetoothSupport();
  }

  Future<void> _checkBluetoothSupport() async {
    // Check if Bluetooth is supported by the hardware
    if (await FlutterBluePlus.isSupported == false) {
      print("Bluetooth not supported by this device");
      return;
    }

    // Handle Bluetooth state changes
    var subscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      print("Bluetooth Adapter State: $state");
      if (state == BluetoothAdapterState.on) {
        // Bluetooth is on, but don't auto-start scanning
        print("Bluetooth is on and ready for scanning.");
      } else {
        // Handle other states such as Bluetooth off
        print("Bluetooth is off");
      }
    });
  }

  Future<void> scanDevices() async {
    // Request necessary Bluetooth permissions
    if (await Permission.bluetoothScan.request().isGranted) {
      if (await Permission.bluetoothConnect.request().isGranted) {
        scannedDevices.clear(); // Clear previously scanned devices

        // Start scanning for devices
        isScanning.value = true; // Set scanning state to true
        FlutterBluePlus.startScan(timeout: Duration(seconds: 5));

        // Listen to scan results
        _scanResultsSubscription = FlutterBluePlus.scanResults.listen((results) {
          for (ScanResult result in results) {
            if (!scannedDevices.contains(result)) {
              scannedDevices.add(result); // Add new device to the list
              print('${result.device.remoteId}: "${result.advertisementData.advName}" found!');
            }
          }
        });
      } else {
        print("Bluetooth connect permission denied");
      }
    } else {
      print("Bluetooth scan permission denied");
    }
  }

  Future<void> stopScan() async {
    if (isScanning.value) {
      // Stop scanning for devices
      await FlutterBluePlus.stopScan();
      isScanning.value = false; // Set scanning state to false
      print("Stopped scanning for devices");
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    // Listen for disconnection events
    var connectionSubscription = device.connectionState.listen((BluetoothConnectionState state) {
      if (state == BluetoothConnectionState.disconnected) {
        print("Disconnected from ${device.remoteId}");
      }
    });

    // Connect to the device
    await device.connect(autoConnect: true);

    // Wait for the connection state
    await device.connectionState.where((state) => state == BluetoothConnectionState.connected).first;

    print("Connected to ${device.remoteId}");

    // Cancel the connection subscription when done
    connectionSubscription.cancel();
  }

  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await device.disconnect();
    print("Disconnected from ${device.remoteId}");
  }

  @override
  void onClose() {
    // Clean up subscriptions
    _scanResultsSubscription.cancel();
    super.onClose();
  }

  // Stream getter for external use if needed
  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults; // Accessed as a static getter
}
