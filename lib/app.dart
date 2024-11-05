import 'package:flutter/cupertino.dart'; // Import Cupertino package
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'dock.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {

    return CupertinoApp(
      debugShowCheckedModeBanner: false,// Use CupertinoApp
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.black,
      ),
      home:
      CupertinoPageScaffold(
        backgroundColor: Colors.lightBlueAccent,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Container(


              )),

              const Dock(items: [
                CupertinoIcons.person,
                CupertinoIcons.chat_bubble,
                CupertinoIcons.camera,
                CupertinoIcons.photo,
                CupertinoIcons.music_house,
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
