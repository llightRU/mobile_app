import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart'; // For navigation to the detailed screen
import 'service_screen.dart';
import 'uuid_mappings.dart'; // Import the uuid_mappings.dart file

class DeviceScreen extends StatefulWidget {
  final BluetoothDevice device;

  DeviceScreen({Key? key, required this.device}) : super(key: key);

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  List<BluetoothService> _services = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchServices();
  }

  Future<void> _fetchServices() async {
    try {
      // Connect to the device
      await widget.device.connect();

      // Discover services
      _services = await widget.device.discoverServices();
    } catch (e) {
      print("Error fetching services: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.device.name.isNotEmpty ? widget.device.name : 'Device Details'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _services.isEmpty
              ? Center(child: Text('No services found.'))
              : ListView.builder(
                  itemCount: _services.length,
                  itemBuilder: (context, index) {
                    final service = _services[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(getServiceName(service.uuid.toString()).isNotEmpty
                            ? getServiceName(service.uuid.toString())
                            : 'Unknown Service'),
                        subtitle: Text('UUID: ${service.uuid.toString()}'),
                        onTap: () {
                          // Navigate to service details screen
                          Get.to(() => ServiceScreen(service: service));
                        },
                      ),
                    );
                  },
                ),
    );
  }

  @override
  void dispose() {
    // Disconnect the device when leaving the screen
    widget.device.disconnect();
    super.dispose();
  }
}
