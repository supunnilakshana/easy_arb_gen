import 'dart:convert';
import 'package:easy_arb_gen/src/config/conf_keys.dart';

// Model representing CSV options for code generation
class CsvOptions {
  // List of supported languages for localization
  final List<dynamic> langs;

  // Flag indicating whether descriptions are included in the CSV file
  final bool ishaveDescription;

  // Constructor for CsvOptions class
  CsvOptions({
    required this.langs,
    required this.ishaveDescription,
  });

  // Copy constructor for creating a new instance with modified values
  CsvOptions copyWith({
    List<String>? langs,
    bool? ishaveDescription,
  }) {
    return CsvOptions(
      langs: langs ?? this.langs,
      ishaveDescription: ishaveDescription ?? this.ishaveDescription,
    );
  }

  // Convert CsvOptions instance to a map for serialization
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ConfigKeys.langList: langs,
      ConfigKeys.isDescriptionHave: ishaveDescription,
    };
  }

  // Factory method to create CsvOptions instance from a map
  factory CsvOptions.fromMap(Map<dynamic, dynamic> map) {
    return CsvOptions(
      langs: map[ConfigKeys.langList]
          .map((element) => element.toString())
          .toList(),
      ishaveDescription: map[ConfigKeys.isDescriptionHave] ?? false,
    );
  }

  // Convert CsvOptions instance to JSON string
  String toJson() => json.encode(toMap());

  // Factory method to create CsvOptions instance from JSON string
  factory CsvOptions.fromJson(String source) =>
      CsvOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  // Override toString() for a more readable representation of CsvOptions
  @override
  String toString() =>
      'CsvOptions(langs: $langs, ishaveDescription: $ishaveDescription)';
}
