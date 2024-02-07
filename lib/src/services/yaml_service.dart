import 'dart:io';
import 'package:easy_arb_gen/src/config/conf_keys.dart';
import 'package:easy_arb_gen/src/models/package_config.dart';
import 'package:yaml/yaml.dart';

// Service for reading configuration from pubspec.yaml file
class YamlService {
  // Retrieve and parse the package configuration from pubspec.yaml
  PackageConfig? getPackageConfig() {
    final Map<dynamic, dynamic>? yamlMap = _getPackageArgs();

    try {
      if (yamlMap != null) {
        // Check if 'csv_options' field is present in the configuration
        final csvOptions = yamlMap[ConfigKeys.csvOptions];
        if (csvOptions == null) {
          print("Validation Error: 'csv_options' field must be required");
          exit(1);
        }

        // Create and return a PackageConfig instance
        final PackageConfig packageConfig = PackageConfig.fromMap(yamlMap);
        return packageConfig;
      } else {
        print(
            "Validation Error: 'easy_arb_gen' configuration field must be required in pubspec.yaml");
        exit(1);
      }
    } on Exception catch (_) {
      print("Validation Error: Invalid configuration!!");
      exit(1);
    }
  }

  // Read and parse the 'easy_arb_gen' configuration section from pubspec.yaml
  Map<dynamic, dynamic>? _getPackageArgs() {
    final file = File(ConfigKeys.pubspecFilePath);
    final yamlString = file.readAsStringSync();
    final Map<dynamic, dynamic> pubspecMap = loadYaml(yamlString);
    return pubspecMap[ConfigKeys.pubspecPackageSectionId];
  }
}
