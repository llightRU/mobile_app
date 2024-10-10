import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class TemperatureMeasurementWidget extends StatefulWidget {
  final BluetoothCharacteristic characteristic;

  TemperatureMeasurementWidget({Key? key, required this.characteristic}) : super(key: key);

  @override
  _TemperatureMeasurementWidgetState createState() => _TemperatureMeasurementWidgetState();
}

class _TemperatureMeasurementWidgetState extends State<TemperatureMeasurementWidget> {
  String temperatureValue = 'N/A'; // To hold the temperature value
  bool isListening = false; // Track if we are listening for indications

  @override
  void initState() {
    super.initState();
    _enableIndications(); // Enable indications when the widget is initialized
  }

  Future<void> _enableIndications() async {
    try {
      // Find the CCC descriptor (UUID: 2902)
      final List<BluetoothDescriptor> descriptors = await widget.characteristic.descriptors;
      BluetoothDescriptor? cccDescriptor;

      // Check if the descriptor exists
      for (var descriptor in descriptors) {
        if (descriptor.uuid.toString() == '2902') {
          cccDescriptor = descriptor;
          break; // Exit loop if found
        }
      }

      if (cccDescriptor != null) {
        // Enable indications
        await cccDescriptor.write([0x01, 0x00]); // Enable indications (0x01)
        print("Indications enabled on characteristic: ${widget.characteristic.uuid}");

        // Start listening for changes
        widget.characteristic.value.listen((value) {
          if (value.isNotEmpty) {
            // Assume the first byte is the temperature; adjust as needed for your device
            double temperature = value[0].toDouble(); // Convert the value to double
            setState(() {
              temperatureValue = temperature.toString(); // Update the state
            });
            print("Temperature indicated: $temperatureValue °C");
          }
        });

        setState(() {
          isListening = true; // Update listening status
        });
      } else {
        print("Client Characteristic Configuration (2902) descriptor not found.");
      }
    } catch (e) {
      print("Error enabling indications: $e");
    }
  }

  Future<void> _disableIndications() async {
    try {
      final List<BluetoothDescriptor> descriptors = await widget.characteristic.descriptors;
      BluetoothDescriptor? cccDescriptor;

      for (var descriptor in descriptors) {
        if (descriptor.uuid.toString() == '2902') {
          cccDescriptor = descriptor;
          break; // Exit loop if found
        }
      }

      if (cccDescriptor != null) {
        await cccDescriptor.write([0x00, 0x00]); // Disable indications (0x00)
        print("Indications disabled on characteristic: ${widget.characteristic.uuid}");
        setState(() {
          isListening = false; // Update listening status
        });
      } else {
        print("Client Characteristic Configuration (2902) descriptor not found.");
      }
    } catch (e) {
      print("Error disabling indications: $e");
    }
  }

  @override
  void dispose() {
    if (isListening) {
      _disableIndications(); // Stop listening when screen is disposed
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Temperature Measurement',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        Text(
          'Current Temperature: $temperatureValue °C', // Show temperature value
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: isListening ? _disableIndications : _enableIndications,
          style: ElevatedButton.styleFrom(
            backgroundColor: isListening ? Colors.green : Colors.red,
          ),
          child: Text(
            isListening ? 'Stop Indicating' : 'Start Indicating',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
