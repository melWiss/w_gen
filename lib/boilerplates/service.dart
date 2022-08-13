String serviceString(String name) {
  return '''
import 'dart:convert';
import '../models/${name.toLowerCase()}.dart';
import 'package:synchro_http/synchro_http.dart';

class ${name}Service {
  // TODO: [$name] add your missing static methods here.
  /// fetch all $name
  static Future<List<$name>> all() async {
    // TODO: [$name] api calls here
    return [];
  }

  /// fetch $name by id
  static Future<$name> get(String id) async {
    // TODO: [$name] api calls here
    return $name();
  }

  /// add $name
  static Future<$name> add($name ${name.toLowerCase()}) async {
    // TODO: [$name] api calls here
    return ${name.toLowerCase()};
  }

  /// update $name
  static Future<$name> update($name ${name.toLowerCase()}) async {
    // TODO: [$name] api calls here
    return ${name.toLowerCase()};
  }

  /// delete $name
  static Future<$name> delete($name ${name.toLowerCase()}) async {
    // TODO: [$name] api calls here
    return ${name.toLowerCase()};
  }
}
''';
}
