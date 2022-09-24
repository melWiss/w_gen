String blocString(String name, bool withSynchro) {
  return '''
${withSynchro ? "import 'package:synchro_http/synchro_http.dart';" : "import 'package:rxdart/rxdart.dart';"}
import '../models/${name.toLowerCase()}.dart';
import '../services/${name.toLowerCase()}.dart';
import '../events/${name.toLowerCase()}.dart';


class ${name}Bloc {
  // TODO: [$name] add your missing properties and methods here.

  /// the controller of ${name}Bloc events
  BehaviorSubject<${name}Event> _controller =
      BehaviorSubject<${name}Event>.seeded(${name}Event.loaded);

  /// the stream of $name events
  Stream<${name}Event> get stream => _controller.stream;

  /// the state variable of $name
  List<$name>? _state = [];

  /// the state getter of $name
  List<$name>? get state => _state;

  /// the current event of $name stream
  ${name}Event get event => _controller.value;

  /// the singleton
  static final ${name}Bloc instance = ${name}Bloc._();

  /// private constructor
  ${name}Bloc._() {
    // TODO: [$name] load and sync your data here
    ${withSynchro ? '''fetchAll().whenComplete((){
      SynchroHttp.singleton.sync.listen((event) {});
    });''' : "fetchAll();"}
  }

  /// factory constructor, don't touch it
  factory ${name}Bloc() {
    return instance;
  }

  /// fetches all $name
  Future fetchAll() async {
    _controller.add(${name}Event.loading);
    _state = await ${name}Service.all();
    _controller.add(${name}Event.loaded);
  }

}
''';
}
