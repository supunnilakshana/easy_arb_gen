import 'dart:convert';
import 'dart:io';

import 'package:easy_arb_gen/src/config/conf_keys.dart';
import 'package:easy_arb_gen/src/models/package_config.dart';

// Service for generating ARB files from CSV input based on package configuration
class ArbService {
  // Private method to convert CSV to ARB format
  void _csvToArb(String csvFilePath, String arbFilePath, int index, String lang,
      bool ishaveDescription) {
    // Map to store ARB data
    final Map<String, dynamic> data = {};

    // Read CSV file
    final csvFile = File(csvFilePath);
    final lines = csvFile.readAsLinesSync();

    // Set locale tag in ARB data
    data[ConfigKeys.localeTag] = lang;

    // Process CSV lines and populate ARB data
    if (!ishaveDescription) {
      for (final line in lines) {
        if (line.isNotEmpty) {
          final row = line.split(',');
          final key = row[0].trim();
          final value = row[index];
          final descriptionVal = {ConfigKeys.description: " "};
          data[key] = value;
          data["@$key"] = descriptionVal;
        }
      }
    } else {
      for (final line in lines) {
        if (line.isNotEmpty) {
          final row = line.split(',');
          final key = row[0].trim();
          final value = row[index + 1];
          final descriptionVal = {ConfigKeys.description: row[1]};
          data[key] = value;
          data["@$key"] = descriptionVal;
        }
      }
    }

    // Write ARB data to the output file
    final arbFile = File(arbFilePath);
    arbFile.writeAsStringSync(jsonEncode(data), flush: true);
  }

  // Method to generate ARB files based on the provided package configuration
  void generateArb(PackageConfig packageConfig) {
    try {
      for (var index = 0;
          index < packageConfig.csvOptions.langs.length;
          index++) {
        String lang = packageConfig.csvOptions.langs[index].toString();
        String outFileName = "${packageConfig.outputFilePrepend + lang}.arb";
        String outFilePath = "${packageConfig.outputDirectory}/$outFileName";

        // Call the private method to convert CSV to ARB for each language
        _csvToArb(packageConfig.csvFilepath, outFilePath, index + 1, lang,
            packageConfig.csvOptions.ishaveDescription);
      }
    } catch (_) {
      print("Invalid CSV value!!");
      exit(1);
    }
  }
}
