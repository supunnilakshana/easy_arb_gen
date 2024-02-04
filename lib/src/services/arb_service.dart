import 'dart:convert';
import 'dart:io';

import 'package:easy_arb_gen/src/models/package_config.dart';

class ArbService {
  _csvToArb(String csvFilePath, String arbFilePath, int index) {
    final Map<String, dynamic> data = {};

    final csvFile = File(csvFilePath);
    final lines = csvFile.readAsLinesSync();

    for (final line in lines) {
      final row = line.split(',');
      final key = row[0];
      final value = row[index];
      data[key] = value;
    }

    final arbFile = File(arbFilePath);
    arbFile.writeAsStringSync(jsonEncode(data), flush: true);
  }

  genarateArb(PackageConfig packageConfig) {
    for (var index = 0;
        index < packageConfig.csvOptions.langs.length;
        index++) {
      String lang = packageConfig.csvOptions.langs[index].toString();
      String outFileName = "${packageConfig.outputFilePrepend + lang}.arb";
      String outFilePath = "${packageConfig.outputDirectory}/$outFileName";

      _csvToArb(packageConfig.csvFilepath, outFilePath, index + 1);
    }
  }
}
