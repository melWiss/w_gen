String enumString(String name) {
  return '''
// TODO: [$name] add more states when you need it.
enum ${name}State {
  loading,
  loaded,
}
''';
}
