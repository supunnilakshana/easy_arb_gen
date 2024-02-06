import 'dart:convert';
import 'package:easy_arb_gen/src/config/conf_keys.dart';
import 'csv_option.dart';

// package option class is there
class PackageConfig {
  final String csvFilepath;
  final String outputDirectory;
  final String outputFilePrepend;
  final CsvOptions csvOptions;
  PackageConfig({
    required this.csvFilepath,
    required this.outputDirectory,
    required this.outputFilePrepend,
    required this.csvOptions,
  });

  PackageConfig copyWith({
    String? csvFilepath,
    String? outputDirectory,
    String? outputFilePrepend,
    CsvOptions? csvOptions,
  }) {
    return PackageConfig(
      csvFilepath: csvFilepath ?? this.csvFilepath,
      outputDirectory: outputDirectory ?? this.outputDirectory,
      outputFilePrepend: outputFilePrepend ?? this.outputFilePrepend,
      csvOptions: csvOptions ?? this.csvOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ConfigKeys.csvFilepath: csvFilepath,
      ConfigKeys.outputDirectory: outputDirectory,
      ConfigKeys.outputFilePrepend: outputFilePrepend,
      ConfigKeys.csvOptions: csvOptions.toMap(),
    };
  }

  factory PackageConfig.fromMap(Map<dynamic, dynamic> map) {
    return PackageConfig(
      csvFilepath: map[ConfigKeys.csvFilepath] as String,
      outputDirectory: map[ConfigKeys.outputDirectory] as String,
      outputFilePrepend: map[ConfigKeys.outputFilePrepend] as String,
      csvOptions: CsvOptions.fromMap(map[ConfigKeys.csvOptions]),
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageConfig.fromJson(String source) =>
      PackageConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PackageConfig(csvFilepath: $csvFilepath, outputDirectory: $outputDirectory, outputFilePrepend: $outputFilePrepend, csvOptions: $csvOptions)';
  }

  @override
  bool operator ==(covariant PackageConfig other) {
    if (identical(this, other)) return true;

    return other.csvFilepath == csvFilepath &&
        other.outputDirectory == outputDirectory &&
        other.outputFilePrepend == outputFilePrepend &&
        other.csvOptions == csvOptions;
  }

  @override
  int get hashCode {
    return csvFilepath.hashCode ^
        outputDirectory.hashCode ^
        outputFilePrepend.hashCode ^
        csvOptions.hashCode;
  }
}
