// Code has been taken from here and modified:
// https://github.com/PlugFox/template/blob/master/tool/dart/rename_project.dart

import 'dart:io' as io;

import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;

const String _defaultName = 'web_template';
const String _defaultDescription = 'web_template_description';

/// dart run tools/rename_project.dart --name="yourname" --description="yourdescription"
void main([final List<String>? args]) {
  if (args == null || args.isEmpty) {
    _throwArguments();
  }
  String? extractArg(final String key) {
    final value = args.firstWhereOrNull((final e) => e.startsWith(key));
    if (value == null) {
      return null;
    }
    return RegExp(r'[\d\w\.\-\_ ]+')
        .allMatches(value.substring(key.length))
        .map((final e) => e.group(0))
        .join()
        .trim();
  }

  final name = extractArg('--name');
  final desc = extractArg('--description');
  if (name == null || desc == null) {
    _throwArguments();
  }
  _renameDirectory(_defaultName, name);
  _changeContent([
    (from: _defaultName, to: name),
    (from: _defaultDescription, to: desc),
  ]);
}

Never _throwArguments() {
  io.stderr.writeln('Pass arguments: '
      '--name="name" '
      '--description="description"');
  io.exit(1);
}

Iterable<io.FileSystemEntity> _recursiveDirectories(
  final io.Directory directory,
) sync* {
  const excludeFiles = <String>{
    'README.md',
    'rename_project.dart',
  };
  const includeExtensions = <String>{
    '.dart',
    '.yaml',
    '.gradle',
    '.xml',
    '.kt',
    '.plist',
    '.txt',
    '.cc',
    '.cpp',
    '.rc',
    '.xcconfig',
    '.pbxproj',
    '.xcscheme',
    '.html',
    '.json',
  };
  for (final e in directory.listSync(followLinks: false)) {
    if (p.basename(e.path).startsWith('.')) {
      continue;
    }
    if (e is io.File) {
      if (!includeExtensions.contains(p.extension(e.path))) {
        continue;
      }
      if (excludeFiles.contains(p.basename(e.path))) {
        continue;
      }
      yield e;
    } else if (e is io.Directory) {
      yield e;
      yield* _recursiveDirectories(e);
    }
  }
}

void _renameDirectory(final String from, final String to) =>
    _recursiveDirectories(io.Directory.current)
        .whereType<io.Directory>()
        .toList(growable: false)
        .where((final dir) => p.basename(dir.path) == from)
        .forEach(
          (final dir) => dir.renameSync(p.join(p.dirname(dir.path), to)),
        );

void _changeContent(final List<({String from, String to})> pairs) =>
    _recursiveDirectories(io.Directory.current)
        .whereType<io.File>()
        .forEach((final e) {
      var content = e.readAsStringSync();
      var changed = false;
      for (final pair in pairs) {
        if (!content.contains(pair.from)) {
          continue;
        }
        content = content.replaceAll(pair.from, pair.to);
        changed = true;
      }
      if (!changed) {
        return;
      }
      e.writeAsStringSync(content);
    });
