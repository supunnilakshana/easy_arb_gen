import 'package:easy_arb_gen/src/easy_arb_gen_base.dart';

/// Main entry point for the EasyArbGen tool.
///
/// This script initializes an instance of [EasyArbGen] and calls the [runJob] method
/// to execute the EasyArbGen tool, which generates ARB files based on the configuration
/// specified in the pubspec.yaml file.
void main() {
  // Initialize and run the EasyArbGen tool
  EasyArbGen().runJob();
}
