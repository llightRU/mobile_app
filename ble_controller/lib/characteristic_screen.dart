import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import './widget/led_controller.dart';
import './widget/temperature_measure.dart';

class CharacteristicScreen extends StatelessWidget {
  final BluetoothCharacteristic characteristic;

  CharacteristicScreen({Key? key, required this.characteristic}) : super(key: key);

  // UUIDs for special characteristics
  final String ledControlUuid = '5b026510-4088-c297-46d8-be6c736a087a';
  final String temperatureMeasurementUuid = '2a1c';

  Widget _buildCharacteristicWidget() {
    final uuidLower = characteristic.uuid.toString().toLowerCase();

    if (uuidLower == ledControlUuid) {
      // Call the LED control widget
      return LedControlWidget(characteristic: characteristic);
    } else if (uuidLower == temperatureMeasurementUuid) {
      // Call the Temperature Measurement widget
      return TemperatureMeasurementWidget(characteristic: characteristic);
    } else {
      // Default display for non-special characteristics
      return Text('Characteristic: $uuidLower');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characteristic: ${characteristic.uuid.toString().toLowerCase()}'),
      ),
      body: Center(
        child: _buildCharacteristicWidget(), // Render appropriate widget based on UUID
      ),
    );
  }
}
