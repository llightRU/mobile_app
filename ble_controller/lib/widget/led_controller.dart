import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class LedControlWidget extends StatefulWidget {
  final BluetoothCharacteristic characteristic;

  LedControlWidget({Key? key, required this.characteristic}) : super(key: key);

  @override
  _LedControlWidgetState createState() => _LedControlWidgetState();
}

class _LedControlWidgetState extends State<LedControlWidget> {
  bool isLedOn = false; // Track the LED state

  Future<void> _toggleLed(bool value) async {
    final command = value ? 1 : 0; // Command to send (1 for ON, 0 for OFF)

    try {
      if (widget.characteristic.properties.write) {
        await widget.characteristic.write([command]);
        setState(() {
          isLedOn = value; // Update the LED state
        });
        print("LED turned ${value ? 'ON' : 'OFF'}");
      } else {
        print("Characteristic does not support writing.");
      }
    } catch (e) {
      print("Error sending command: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'LED Control',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isLedOn ? Colors.yellow : Colors.grey,
          ),
          onPressed: () {
            _toggleLed(!isLedOn); // Toggle LED state
          },
          child: Text(
            isLedOn ? 'LED ON' : 'LED OFF',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
