import 'dart:io';
import 'package:easy_arb_gen/src/config/conf_keys.dart';
import 'package:easy_arb_gen/src/models/package_config.dart';
import 'package:yaml/yaml.dart';

class YamlService {
  PackageConfig? getPackageConfig() {
    final Map<dynamic, dynamic>? yamlMap = _getPackageArgs();

    try {
      if (yamlMap != null) {
        final csvOptions = yamlMap[ConfigKeys.csvOptions];
        if (csvOptions == null) {
          print("Validation Error: csv_options filed must be required");
          exit(1);
        }
        final PackageConfig packageConfig = PackageConfig.fromMap(yamlMap);
        return packageConfig;
      } else {
        print(
            "Validation Error: eassy_arb configuration filed must be required in pubspec.yml");
        exit(1);
      }
    } on Exception catch (_) {
      print("Validation Error: Invalid configuration!!");
      exit(1);
    }
  }

  Map<dynamic, dynamic>? _getPackageArgs() {
    final file = File(ConfigKeys.pubspecFilePath);
    final yamlString = file.readAsStringSync();
    final Map<dynamic, dynamic> pubsepcMap = loadYaml(yamlString);
    return pubsepcMap[ConfigKeys.pubspecPackageSectionId];
  }
}
