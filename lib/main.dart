import 'package:flutter/material.dart';
import 'package:valorant_app/injection_container.dart' as di;

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const ValorantApp());
}
