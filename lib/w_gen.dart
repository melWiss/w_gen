import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart';
import 'package:w_gen/boilerplates/bloc.dart';
import 'package:w_gen/boilerplates/enum.dart';
import 'package:w_gen/boilerplates/model.dart';
import 'package:w_gen/boilerplates/service.dart';

class CreateCommand {
  final ArgParser _create = ArgParser();

  String? _arg;

  ArgParser get create => _create;

  bool withSynchro = false;

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
          _createModel();
        }
      },
    );
    _create.addFlag(
      "with-synchro",
      callback: (p0) {
        withSynchro = p0;
        if (_arg != null) {
          if (p0) {
            Process.runSync("flutter", ["pub", "add", "synchro_http"]);
            print("running flutter pub add synchro_http");
          } else {
            Process.runSync("flutter", ["pub", "add", "rxdart", "http"]);
            print("running flutter pub add rxdart http");
          }
        }
      },
    );
    _create.addFlag(
      "service",
      abbr: "s",
      callback: (p0) {
        if (p0) {
          _createService();
        }
      },
    );
    _create.addFlag(
      "bloc",
      abbr: "b",
      callback: (p0) {
        if (p0) {
          _createBloc();
        }
      },
    );
  }

  _createModel() {
    print("creating $_arg Model");
    var path = join(Directory.current.path, "lib", "src", "models",
        "${_arg!.toLowerCase()}.dart");
    var file = File(path);
    // if (!file.existsSync() && _arg != null) {
    if (_arg != null) {
      file.createSync(recursive: true);
      file.writeAsStringSync(modelString(_arg!));
    }
  }

  _createService() {
    print("creating ${_arg}Service");
    var path = join(Directory.current.path, "lib", "src", "services",
        "${_arg!.toLowerCase()}.dart");
    var file = File(path);
    // if (!file.existsSync() && _arg != null) {
    if (_arg != null) {
      file.createSync(recursive: true);
      file.writeAsStringSync(serviceString(_arg!, withSynchro));
    }
  }

  _createBloc() {
    print("creating ${_arg}Bloc");
    var path1 = join(Directory.current.path, "lib", "src", "blocs",
        "${_arg!.toLowerCase()}.dart");
    var file1 = File(path1);
    var path2 = join(Directory.current.path, "lib", "src", "enums",
        "${_arg!.toLowerCase()}.dart");
    var file2 = File(path2);
    // if (!file1.existsSync() && !file2.existsSync() && _arg != null) {
    if (_arg != null) {
      file1.createSync(recursive: true);
      file2.createSync(recursive: true);
      file1.writeAsStringSync(blocString(_arg!, withSynchro));
      file2.writeAsStringSync(enumString(_arg!));
    }
  }
}
