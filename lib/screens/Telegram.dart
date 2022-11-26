import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hilpad/screens/Widgets/connectTelegram.dart';
import 'package:hilpad/services/ThemeService.dart';
import 'package:web_socket_channel/io.dart';

class Telegram extends StatelessWidget {
  final ThemeController tc = Get.put(ThemeController());
  // var value = "".obs;
  // var channel = IOWebSocketChannel.connect(Uri.parse('WebSocket URL'));

  @override
  Widget build(BuildContext context) {
    // channel.stream.listen((message) {
    //   value.value = message;
    // });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: tc.isDarkMode.value
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor));
    return Scaffold(
      appBar: AppBar(
        title: Text("Connect to Telegram"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: connectTelegram(),
    );
  }
}
