import 'dart:io';

import 'package:easy_arb_gen/easy_arb_gen.dart';
import 'package:easy_arb_gen/src/models/package_config.dart';

class EasyArbGen {
  final ArbService _arbService = ArbService();
  final YamlService _yamlService = YamlService();
  void runJob() {
    try {
      PackageConfig? packageConfig = _yamlService.getPackageConfig();
      if (packageConfig == null) {
        print("Validation Error: Invalid configuration!!");
        exit(1);
      }
      _arbService.genarateArb(packageConfig);
      print("Sucess: Successfully genarated!!");
    } catch (e) {
      print("Error : $e");
    }
  }
}
