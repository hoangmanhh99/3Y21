import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../utils/app_constants.dart';
import 'dart:developer' as developer;

import '../../../utils/colors.dart';
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
  String _lastError = '';
  String _lastStatus = '';
  double _confidence = 0.0;
  bool _hasSpeech = false;
  bool _logEvents = true;

  String _currentLocaleId = '';
  List<LocaleName> _localeNames = [];
  @override
  void initState() {
    super.initState();
    _speechToText = SpeechToText();
    // _initSpeech();
    initSpeedState();
  }

  Future initSpeedState() async {
    _logEvent("Initialize");
    try {
      var hasSpeed = await _speechToText.initialize(
          onError: errorListener, onStatus: statusListener, debugLogging: true);
      if (hasSpeed) {
        _localeNames = await _speechToText.locales();

        var systemLocale = await _speechToText.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? "";

        if (!mounted) return;

        setState(() {
          _hasSpeech = hasSpeed;
        });
      }
    } catch (e) {
      setState(() {
        _lastError = 'Speed recognition failed: ${e.toString()}';
        _hasSpeech = false;
      });
    }
  }

  void startListening() {
    _logEvent('start listening');
    _lastWords = '';
    _lastError = '';
    // final pauseFor = int.tryParse(_pauseForController.text);
    // final listenFor = int.tryParse(_listenForController.text);
    // Note that `listenFor` is the maximum, not the minimun, on some
    // systems recognition will be stopped before this value is reached.
    // Similarly `pauseFor` is a maximum not a minimum and may be ignored
    // on some devices.
    _speechToText.listen(
        onResult: resultListener,
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 3),
        partialResults: true,
        localeId: _currentLocaleId,
        // onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void stopListening() {
    _logEvent('stop');
    _speechToText.stop();
    setState(() {
      _speechEnabled = false;
    });
  }

  void cancelListening() {
    _logEvent('cancel');
    _speechToText.cancel();
    setState(() {
      // level = 0.0;
    });
  }

  /// This callback is invoked each time new recognition results are
  /// available after `listen` is called.
  void resultListener(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    setState(() {
      _lastWords = '${result.recognizedWords}';
      _speechEnabled = false;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${_speechToText.isListening}');
    setState(() {
      _lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${_speechToText.isListening}');
    setState(() {
      _lastStatus = status;
    });
  }

  void _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    developer.log('$selectedVal', name: '');
  }

  void _logEvent(String eventDescription) {
    if (_logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      developer.log('$eventTime $eventDescription', name: '');
    }
  }

  void _switchLogging(bool? val) {
    setState(() {
      _logEvents = val ?? false;
    });
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
              onTap: () {},
              child: Icon(
                _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                size: 84,
              ),
            ),
            kSpacingHeight48,
            Text(
              !_speechToText.isListening
                  ? '$_lastWords'
                  : 'Device listening...',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            kSpacingHeight48,
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
          // onPressed: () async {
          //   _listen();
          //   // _speechToText.isNotListening ? _startListening : _stopListening;
          // },
          onPressed: (!_hasSpeech || _speechToText.isListening)
              ? null
              : () {
                  startListening();
                  _speechEnabled = true;
                },
          child: Icon(_speechToText.isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
    );
  }
}
