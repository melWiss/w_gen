import 'package:args/args.dart';

class CreateCommand {
  final ArgParser _create = ArgParser();

  String? _arg;

  ArgParser get create => _create;

  CreateCommand() {
    _create.addOption(
      "create",
      abbr: 'c',
      callback: (p0) => _arg = p0,
    );
    _create.addFlag(
      "model",
      abbr: "m",
      callback: (p0) {
        if (p0) {
          print("creating Model $_arg");
        }
      },
    );
    _create.addFlag(
      "repository",
      abbr: "r",
      callback: (p0) {
        if (p0) {
          print("creating Repository $_arg");
        }
      },
    );
    _create.addFlag(
      "bloc",
      abbr: "b",
      callback: (p0) {
        if (p0) {
          print("creating Bloc $_arg");
        }
      },
    );
  }
}
