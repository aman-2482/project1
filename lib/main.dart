import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

/// Main entry point of the application.
void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: !kReleaseMode, // Enable only in debug mode
        builder: (context) => const MyApp(), // Wrap your app
      ),
    ),
  );
}