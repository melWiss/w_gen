String enumString(String name) {
  return '''
// TODO: [$name] add more events when you need it.
enum ${name}Event {
  loading,
  loaded,
}
''';
}
