// uuid_mappings.dart

String getServiceName(String uuid) {
  const Map<String, String> serviceNames = {
    '180a': 'Device Information',
    '1d14d6ee-fe63-4fa1-bfa4-8f47b42119f0': 'OTA Service',
    '1809': 'Health Thermometer',
    'de8a5aac-a99b-c315-0c80-60d4cbb51224': 'LED',
  };
  return serviceNames[uuid.toLowerCase()] ?? '';
}

String getCharacteristicName(String uuid) {
  const Map<String, String> characteristicNames = {
    '5b026510-4088-c297-46d8-be6c736a087a': 'LED Control',
    '2a1c': 'Temperature Measurement',
  };
  return characteristicNames[uuid.toLowerCase()] ?? '';
}
