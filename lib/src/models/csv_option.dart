import 'dart:convert';
import 'package:easy_arb_gen/src/config/conf_keys.dart';

class CsvOptions {
  final List<dynamic> langs;

  final bool ishaveDescription;
  CsvOptions({
    required this.langs,
    required this.ishaveDescription,
  });

  CsvOptions copyWith({
    List<String>? langs,
    bool? ishaveDescription,
  }) {
    return CsvOptions(
      langs: langs ?? this.langs,
      ishaveDescription: ishaveDescription ?? this.ishaveDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ConfigKeys.langList: langs,
      ConfigKeys.isDescriptionHave: ishaveDescription,
    };
  }

  factory CsvOptions.fromMap(Map<dynamic, dynamic> map) {
    return CsvOptions(
      langs: map[ConfigKeys.langList]
          .map((element) => element.toString())
          .toList(),
      ishaveDescription: map[ConfigKeys.isDescriptionHave] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CsvOptions.fromJson(String source) =>
      CsvOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CsvOptions(langs: $langs, ishaveDescription: $ishaveDescription)';
}
