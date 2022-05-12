import 'dart:convert';
import 'dart:developer' as developer;
import 'package:alan_voice/alan_voice.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_constants.dart';

class AlanVoicePage extends StatefulWidget {
  static const path = '/alanvoice';
  const AlanVoicePage({Key? key}) : super(key: key);

  @override
  State<AlanVoicePage> createState() => _AlanVoicePageState();
}

class _AlanVoicePageState extends State<AlanVoicePage> {
  _AlanVoicePageState() {
    var authData = jsonEncode({"token": "demo"});
    AlanVoice.addButton(
        '740f7844eebf06ef06c52926cfd54bd02e956eca572e1d8b807a3e2338fdd0dc/stage',
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
    AlanVoice.onCommand.add((command) async {
      if (command.data['command'] == 'YouTube') {
        developer.log('YouTubeLog', name: '');
        AlanVoice.playText('Ahihi');
        // await LaunchApp.openApp(
        //   androidPackageName: 'com.google.android.youtube',
        //   appStoreLink: 'https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=en&gl=US',
        //   // openStore: false
        // );
      } else if (command.data['command'] == 'haha') {
        AlanVoice.playText('hihi');
      }
      developer.log('got new command ${command.toString()}', name: '');
    });
  }

  @override
  void initState() {
    super.initState();
    // _AlanVoicePageState();
  }

  @override
  void dispose() {
    super.dispose();
    AlanVoice.deactivate();
  }

  void _playText() {
    AlanVoice.playText("Hello from Alan");
  }

  void _playCommand() {
    var command = jsonEncode({"command": "commandName"});
    AlanVoice.playCommand(command);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alan Voice'),
      ),
      body: Container(
        child: Column(
          children: [ElevatedButton(onPressed: () {
            _playText();
            setState(() {

            });
          }, child: Text('Play'))],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: AvatarGlow(
      //   animate: true,
      //   glowColor: ColorConstants.primaryColor,
      //   endRadius: 75.0,
      //   duration: const Duration(milliseconds: 2000),
      //   repeatPauseDuration: const Duration(milliseconds: 100),
      //   repeat: true,
      //   child: FloatingActionButton(
      //     onPressed: () async {
      //       // _listen();
      //       // _speechToText.isNotListening ? _startListening : _stopListening;
      //     },
      //     // child: Icon(_speechToText.isListening ? Icons.mic : Icons.mic_none),
      //   ),
      // ),
    );
  }
}
