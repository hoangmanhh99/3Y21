import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../utils/app_constants.dart';
import 'dart:developer' as developer;

import 'alan_voice_page.dart';

class VoicePage extends StatefulWidget {
  static const path = "VoicePage";
  const VoicePage({Key? key}) : super(key: key);

  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  late SpeechToText _speechToText;
  bool _speechEnabled = false;
  String _lastWords = '';
  double _confidence = 0.0;
  @override
  void initState() {
    super.initState();
    _speechToText = SpeechToText();
    // _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize(debugLogging: true);
    setState(() {});
  }

  Future _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  Future _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  Future _listen() async {
    if (!_speechEnabled) {
      bool available = await _speechToText.initialize(
          onStatus: (val) => developer.log('onStatus: $val', name: ''),
          onError: (val) => developer.log('onError: $val', name: ''));
      if (available) {
        setState(() {
          _speechEnabled = true;
        });
        _speechToText.listen(
            onResult: (val) => setState(() {
                  _lastWords = val.recognizedWords;
                  if (val.hasConfidenceRating && val.confidence > 0) {
                    _confidence = val.confidence;
                  }
                }));
      }
    } else {
      setState(() {
        _speechEnabled = false;
        _speechToText.stop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Control'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 32),
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkResponse(
              onTap: () {
                print(1);
                _speechToText.isNotListening ? _startListening : _stopListening;
              },
              child: Icon(
                _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                size: 64,
              ),
            ),
            kSpacingHeight48,
            Text(
              _speechToText.isListening
                  ? '$_lastWords'
                  : _speechEnabled
                      ? 'Tap the microphone to start listening...'
                      : 'Speech not available',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            kSpacingHeight48,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AlanVoicePage.path);
                  },
                  child: Text(
                    'Alan Voice',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _speechEnabled,
        glowColor: ColorConstants.primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () async {
            _listen();
            // _speechToText.isNotListening ? _startListening : _stopListening;
          },
          child: Icon(_speechToText.isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
    );
  }
}
