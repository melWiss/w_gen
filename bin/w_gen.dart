import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:w_gen/w_gen.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('''
Boiler plate code generator by melWiss
Usage:
        w-gen -c [name] -[msb]
''');
  }
  var createCommand = CreateCommand();
  var results = createCommand.create.parse(arguments);
}
