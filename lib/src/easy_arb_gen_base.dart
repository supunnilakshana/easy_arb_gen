import 'dart:io';

import 'package:easy_arb_gen/easy_arb_gen.dart';
import 'package:easy_arb_gen/src/models/package_config.dart';

// Main entry point for the EasyArbGen tool
class EasyArbGen {
  // Instances of services used in the tool
  final ArbService _arbService = ArbService();
  final YamlService _yamlService = YamlService();

  // Method to run the EasyArbGen tool
  void runJob() {
    try {
      // Retrieve the package configuration from pubspec.yaml
      PackageConfig? packageConfig = _yamlService.getPackageConfig();

      // Check if the configuration is valid
      if (packageConfig == null) {
        print("Validation Error: Invalid configuration!!");
        exit(1);
      }

      // Display a processing animation

      // Simulate a simple processing animation
      for (var i = 0; i < 5; i++) {
        // Print a rotating character to indicate activity
        stdout.write("\rProcessing... ${['|', '/', '-', '\\'][i % 4]}");
        sleep(Duration(milliseconds: 300));
      }
      print("\n");
      // Generate ARB files based on the package configuration
      _arbService.generateArb(packageConfig);

      // Print success message
      print("Success: Successfully generated!!");
    } catch (e) {
      // Print any errors that occur during the execution
      print("\nError: $e");
    }
  }
}
