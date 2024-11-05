import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Import DevicePreview for testing on different devices

import 'dock.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.black,
      ),
      home: CupertinoPageScaffold(
        backgroundColor: Colors.lightBlueAccent, // Set background color

        /// Main content layout
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Container()),

              /// Dock widget displaying a row of icons at the bottom of the screen
              const Dock(items: [
                CupertinoIcons.person, // Profile icon
                CupertinoIcons.chat_bubble, // Chat icon
                CupertinoIcons.camera, // Camera icon
                CupertinoIcons.photo, // Photo icon
                CupertinoIcons.music_house, // Music icon
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
