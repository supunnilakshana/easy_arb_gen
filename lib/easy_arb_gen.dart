/// EasyArbGen is a Dart library for generating ARB (Application Resource Bundle) files
/// from CSV input based on a specified configuration in pubspec.yaml.
///
/// To use this library, import it into your Dart code and leverage the provided services
/// such as [YamlService] for reading configuration from pubspec.yaml and [ArbService]
/// for generating ARB files.
///
/// Example:
/// ```dart
/// import 'package:easy_arb_gen/easy_arb_gen.dart';
///
/// void main() {
///   final easyArbGen = EasyArbGen();
///   easyArbGen.runJob();
/// }
/// ```
library easy_arb_gen;

export 'src/services/yaml_service.dart';
export 'src/services/arb_service.dart';
export 'src/easy_arb_gen_base.dart';
