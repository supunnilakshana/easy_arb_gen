// Configuration Keys
class ConfigKeys {
  // Static constants for CSV configuration
  static const csvFilepath = 'csv_filepath'; // Filepath for the CSV input file
  static const outputDirectory =
      'output_directory'; // Directory for generated output files
  static const outputFilePrepend =
      'output_file_prepend'; // Prefix for generated output files
  static const csvOptions = 'csv_options'; // Additional options for CSV parsing

  // Static constants for pubspec.yaml configuration
  static const pubspecFilePath = 'pubspec.yaml'; // Filepath for pubspec.yaml
  static const pubspecPackageSectionId =
      'easy_arb_gen'; // Section identifier in pubspec.yaml

  // Static constants for localization and description
  static const langList = 'langs'; // List of supported languages
  static const isDescriptionHave =
      'is_description_have'; // Flag indicating if descriptions are included
  static const description =
      'description'; // Default description for generated content

  // Special tag for locale identification
  static const localeTag =
      "@@locale"; // Tag used in generated files for placeholder replacement
}
