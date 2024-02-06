<!-- 
This README describes the easy_csv_to_arb package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# easy_csv_to_arb

The `easy_csv_to_arb` package provides a simple and convenient way to convert CSV language files to ARB files for localization in Flutter projects.

## Features

- Convert CSV language files to ARB files effortlessly.
- Customize the CSV file path, output directory, and file name prefix in the pubspec.yaml file.
- Support for specifying languages in the CSV file.
- Option to include descriptions in the CSV file

## Installation

Add this to your pubspec.yaml file:

  dev_dependencies:
    easy_csv_to_arb: ^<LATEST_VERSION>


## Getting started

### Supporting CSV Templates

The `easy_csv_to_arb` package is designed to support two types of CSV templates, offering flexibility in managing localization data for your Flutter projects:

### 1. Normal CSV Template

Use this template when each row represents a translation key, and each column represents a language. The first column contains the keys, and subsequent columns contain translations for each specified language.

Example:
```csv
key, lang1, lang2, lang3,..etc
home_title, Home, ගෙදර, Hogar,..etc
```
### 2. Description CSV Template

For more detailed localization, use this template that includes an additional column for descriptions. The first column contains the keys, the second column contains descriptions, and subsequent columns contain translations for each language.

Example:
```csv
key, description, lang1, lang2, lang3,...etc
home_title, The title for the home screen, Home, ගෙදර, Hogar,..etc
```
## To use this package, follow these steps:

Step 1: Add the following to your pubspec.yaml file:

```yaml
easy_arb_gen:
  csv_filepath: "assets/langs/translations.csv"
  output_directory: "lib/l10n"
  output_file_prepend: "app_"
  csv_options:
    langs:
      - en
      - si
      - es
    is_description_have: false
```
### Important Note

When configuring the `easy_arb_gen` section in your `pubspec.yaml` file, ensure to set the `is_description_have` option according to your CSV template:

- For **Normal CSV Template** (is_description_have: false)
- For **Description CSV Template** (is_description_have: true)

Step 2: Run the Package and Experience the Magic!

Now that you've configured the `easy_arb_gen` section in your `pubspec.yaml` file, it's time to generate your ARB files and experience the magic of easy localization. Follow these steps:

1. Open a terminal in the root directory of your Flutter project.

2. Run the following command:

```bash
dart run package:easy_csv_to_arb
```

## Additional information

## Additional information

If you encounter any issues or have suggestions for improvement, feel free to [file an issue](https://github.com/supunnilakshana/easy_arb_gen/issues). Your feedback is valuable, and we appreciate your help in making this package better.

Contributions are welcome! If you'd like to contribute to the development of the `easy_csv_to_arb` package, check out the [contribution guidelines](https://github.com/supunnilakshana/easy_arb_gen) to get started. We look forward to your contributions!



