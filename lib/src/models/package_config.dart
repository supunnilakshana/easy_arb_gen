import 'dart:convert';
import 'package:easy_arb_gen/src/config/conf_keys.dart';
import 'csv_option.dart';

// Model representing the configuration for the package
class PackageConfig {
  // Filepath for the CSV input file
  final String csvFilepath;

  // Directory for generated output files
  final String outputDirectory;

  // Prefix for generated output files
  final String outputFilePrepend;

  // Options for CSV code generation
  final CsvOptions csvOptions;

  // Constructor for PackageConfig class
  PackageConfig({
    required this.csvFilepath,
    required this.outputDirectory,
    required this.outputFilePrepend,
    required this.csvOptions,
  });

  // Copy constructor for creating a new instance with modified values
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

  // Convert PackageConfig instance to a map for serialization
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ConfigKeys.csvFilepath: csvFilepath,
      ConfigKeys.outputDirectory: outputDirectory,
      ConfigKeys.outputFilePrepend: outputFilePrepend,
      ConfigKeys.csvOptions: csvOptions.toMap(),
    };
  }

  // Factory method to create PackageConfig instance from a map
  factory PackageConfig.fromMap(Map<dynamic, dynamic> map) {
    return PackageConfig(
      csvFilepath: map[ConfigKeys.csvFilepath] as String,
      outputDirectory: map[ConfigKeys.outputDirectory] as String,
      outputFilePrepend: map[ConfigKeys.outputFilePrepend] as String,
      csvOptions: CsvOptions.fromMap(map[ConfigKeys.csvOptions]),
    );
  }

  // Convert PackageConfig instance to JSON string
  String toJson() => json.encode(toMap());

  // Factory method to create PackageConfig instance from JSON string
  factory PackageConfig.fromJson(String source) =>
      PackageConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  // Override toString() for a more readable representation of PackageConfig
  @override
  String toString() {
    return 'PackageConfig(csvFilepath: $csvFilepath, outputDirectory: $outputDirectory, outputFilePrepend: $outputFilePrepend, csvOptions: $csvOptions)';
  }

  // Override equality operator for comparing two PackageConfig instances
  @override
  bool operator ==(covariant PackageConfig other) {
    if (identical(this, other)) return true;

    return other.csvFilepath == csvFilepath &&
        other.outputDirectory == outputDirectory &&
        other.outputFilePrepend == outputFilePrepend &&
        other.csvOptions == csvOptions;
  }

  // Override hashCode for consistent hashing
  @override
  int get hashCode {
    return csvFilepath.hashCode ^
        outputDirectory.hashCode ^
        outputFilePrepend.hashCode ^
        csvOptions.hashCode;
  }
}
