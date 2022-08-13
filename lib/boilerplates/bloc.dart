String blocString(String name) {
  return '''
import 'package:synchro_http/synchro_http.dart';
import '../models/${name.toLowerCase()}.dart';
import '../services/${name.toLowerCase()}.dart';
import '../enums/${name.toLowerCase()}.dart';


class ${name}Bloc {
  // TODO: [$name] add your missing properties and methods here.

  /// the controller of ${name}Bloc states
  BehaviorSubject<${name}State> _controller =
      BehaviorSubject<${name}State>.seeded(${name}State.loaded);

  /// the stream of $name states
  Stream<${name}State> get stream => _controller.stream;

  /// the state variable of $name
  List<$name>? _state = [];

  /// the state getter of $name
  List<$name>? get state => _state;

  /// the singleton
  static final ${name}Bloc instance = ${name}Bloc._();

  /// private constructor
  ${name}Bloc._() {
    // TODO: [$name] load and sync your data here
    fetchAll().whenComplete((){
      SynchroHttp.singleton.sync.listen((event) {});
    });
  }

  /// factory constructor, don't touch it
  factory ${name}Bloc() {
    return instance;
  }

  /// fetches all $name
  fetchAll() async {
    _controller.add(${name}State.loading);
    _state = await ${name}Service.all();
    _controller.add(${name}State.loaded);
  }

}
''';
}
