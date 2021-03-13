import 'dart:io';

String fixtures(String fileName) => File('test/features/number_trivia/data/fixtures/$fileName').readAsStringSync();