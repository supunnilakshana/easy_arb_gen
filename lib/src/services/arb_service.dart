import 'dart:convert';
import 'dart:io';

import 'package:easy_arb_gen/src/config/conf_keys.dart';
import 'package:easy_arb_gen/src/models/package_config.dart';

class ArbService {
  _csvToArb(String csvFilePath, String arbFilePath, int index, String lang,
      bool ishaveDescription) {
    final Map<String, dynamic> data = {};

    final csvFile = File(csvFilePath);
    final lines = csvFile.readAsLinesSync();
    data[ConfigKeys.localeTag] = lang;
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
    final arbFile = File(arbFilePath);
    arbFile.writeAsStringSync(jsonEncode(data), flush: true);
  }

  genarateArb(PackageConfig packageConfig) {
    try {
      for (var index = 0;
          index < packageConfig.csvOptions.langs.length;
          index++) {
        String lang = packageConfig.csvOptions.langs[index].toString();
        String outFileName = "${packageConfig.outputFilePrepend + lang}.arb";
        String outFilePath = "${packageConfig.outputDirectory}/$outFileName";

        _csvToArb(packageConfig.csvFilepath, outFilePath, index + 1, lang,
            packageConfig.csvOptions.ishaveDescription);
      }
    } catch (_) {
      print("Invalid csv value!!");
      exit(1);
    }
  }
}
