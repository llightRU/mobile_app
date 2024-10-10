import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'characteristic_screen.dart';
import 'package:get/get.dart';
import 'uuid_mappings.dart'; // Import the uuid_mappings.dart file

class ServiceScreen extends StatelessWidget {
  final BluetoothService service;

  ServiceScreen({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service: ${service.uuid}'),
      ),
      body: ListView.builder(
        itemCount: service.characteristics.length,
        itemBuilder: (context, index) {
          final characteristic = service.characteristics[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(getCharacteristicName(characteristic.uuid.toString()).isNotEmpty
                  ? getCharacteristicName(characteristic.uuid.toString())
                  : 'Unknown Characteristic'),
              subtitle: Text('UUID: ${characteristic.uuid.toString()}'),
              onTap: () {
                // Navigate to characteristic details screen
                Get.to(() => CharacteristicScreen(characteristic: characteristic));
              },
            ),
          );
        },
      ),
    );
  }
}
