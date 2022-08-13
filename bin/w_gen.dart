import 'dart:io';

import 'package:w_gen/w_gen.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  print('Boiler plate code generator by melWiss');
  var createCommand = CreateCommand();
  var results = createCommand.create.parse(arguments);
}
