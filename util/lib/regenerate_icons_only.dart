// One-shot helper that regenerates lib/font_awesome_flutter.dart from the
// existing lib/fonts/icons.json. It deliberately does NOT touch pubspec.yaml
// font registrations or hit the network, unlike main.dart.
//
// Run from the package root: `dart util/lib/regenerate_icons_only.dart`

// ignore_for_file: avoid_print

import 'dart:io';

import 'main.dart' as gen;

void main() {
  final iconsJson = File('lib/fonts/icons.json');
  if (!iconsJson.existsSync()) {
    print('lib/fonts/icons.json not found. Aborting.');
    exit(1);
  }

  final metadata = <gen.IconMetadata>[];
  final styles = <String>{};
  final versions = <String>[];
  gen.readAndPickMetadata(iconsJson, metadata, styles, versions, const []);

  final highestVersion = gen.calculateFontAwesomeVersion(versions);
  print('Generating icon definitions for font awesome $highestVersion');

  gen.writeCodeToFile(
    () => gen.generateIconDefinitionClass(metadata, highestVersion),
    'lib/font_awesome_flutter.dart',
  );

  print('Done. Regenerated lib/font_awesome_flutter.dart');
}
