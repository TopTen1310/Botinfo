// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:lottie/lottie.dart';


import '/constants.dart';
import '/dio_api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'chat35model.dart';
import 'chatmessage.dart';

class ChatScreen2 extends StatefulWidget {
  const ChatScreen2({super.key});

  @override
  State<ChatScreen2> createState() => _ChatScreen2State();
}

enum TtsState { playing, stopped, paused, continued, ready, reset }

class _ChatScreen2State extends State<ChatScreen2> with TickerProviderStateMixin {
  final TextEditingController textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  // ChatGPT? chatGPT;
  bool _isImageSearch = false;
  SpeechToText speechToText = SpeechToText();
  var text = 'Ask anything to Botinfo';
  late final AnimationController _controller;
  late final AnimationController _nwavecontroller;
  late final AnimationController _controllerListening;

  StreamSubscription? _subscription;
  bool _isTyping = false;
  var isListing = false;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  bool get isWindows => !kIsWeb && Platform.isWindows;

  bool get isWeb => kIsWeb;

  initTts() async {
    flutterTts = FlutterTts();
    flutterTts = FlutterTts();
    await flutterTts.setSharedInstance(true);

    _setAwaitOptions();
    await flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        ],
        IosTextToSpeechAudioMode.voicePrompt);

    await flutterTts.awaitSynthCompletion(true);

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() async{

        print("Complete");
        ttsState = TtsState.stopped;
        await flutterTts.stop();
        isListing = false;
        _isTyping = false;
        ttsState = TtsState.reset;
        setState(() {});

    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;

  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();

    _subscription?.cancel();

    _controller.dispose();
    _nwavecontroller.dispose();
    _controllerListening.dispose();

    Constant.newUser = "1";

  }

  @override
  void initState() {
    super.initState();
    ttsState = TtsState.reset;
    initTts();

    _controller = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });

    _controllerListening = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllerListening.reset();
          _controllerListening.forward();
        }
      });

    _nwavecontroller = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _nwavecontroller.reset();
          _nwavecontroller.forward();
        }
      });
  }

  Rx<Chat35Model> cm = Chat35Model().obs;

  Future<void> chatAPI() async {
  //    var jsonData2 = {
  //     "model": "text-davinci-003",
  //     "prompt": textController.text,
  //     "temperature": 0.9,
  //     "max_tokens": 150,
  //     "top_p": 1,
  //     "frequency_penalty": 0.0,
  //     "presence_penalty": 0.6,
  //     "stop": [" Human:", " AI:"]
  //   };
  //   final response = await DioResponse.postApi(
  //       'https://api.openai.com/v1/completions', jsonData2);
  //   if (response != null) {
  //     cm.value = chatModel.fromJson(response?.data);
  //   } else {
  //     cm.value = chatModel.fromJson({});
  //   }
  // }
    var jsonData2 = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": textController.text,
        }
      ]
    };
     final response = await DioResponse.postApi(
        'https://api.openai.com/v1/chat/completions', jsonData2);

    print("response 0000");
    print(response);
    if (response != null) {
      cm.value = Chat35Model.fromJson(response.data);
    } else {
      cm.value = Chat35Model.fromJson({});
    }
  }

  void _sendMessage() async {
    //
    // print("textController.text 00");
    // print(textController.text);
    textController.text = "hello";

    if (textController.text.isEmpty) {

      // _isTyping = true;
      // isListing = false;
      //
      // textController.clear();
      //
      // insertNewData('Please say something.');
      // // ttsState = TtsState.ready;
      // flutterTts.speak('Please say something.');
      return;
    }
    ChatMessage message = ChatMessage(
      text: textController.text,
      sender: "user",
      isImage: false,
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });
    _isTyping = true;

    await chatAPI();
    _isTyping = false;

    textController.clear();

    insertNewData(cm.value.choices?[0].message?.content  ?? 'Please reset and try again.');
    ttsState = TtsState.stopped;
    flutterTts
        .speak(cm.value.choices?[0].message?.content ?? 'Please reset and try again.');
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "bot",
      isImage: isImage,
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  final key = GlobalKey<State<Tooltip>>();

  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;
  String? _newVoiceText;
  int? _inputLength;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app-icon-black-bg.png',
                  height: 25.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text('BOTINFO',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ))
              ],
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: (isListing)
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !(ttsState == TtsState.playing ||
                            ttsState == TtsState.stopped ||
                            ttsState == TtsState.ready),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {});

                                if (ttsState == TtsState.playing) {
                                  return;
                                }

                                if (_isTyping) {
                                  return;
                                }

                                setState(() {});
                                if (!isListing) {
                                  isListing = true;
                                  _controller.reset();
                                  _controller.forward();
                                  var available =
                                      await speechToText.initialize();
                                  if (available) {
                                    setState(() {
                                      isListing = true;
                                      speechToText.listen(onResult: (result) {
                                        setState(() {
                                          textController.text =
                                              result.recognizedWords;
                                        });
                                      });
                                    });
                                  }
                                } else {
                                  setState(() {
                                    isListing = false;
                                  });
                                  _controller.reset();
                                  speechToText.stop();
                                  _controller.stop(canceled: false);


                                  _sendMessage();
                                }

                                return;
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.width *
                                        0.95,
                                    decoration: BoxDecoration(),
                                    child: Lottie.asset(
                                      'assets/images/mic.json',
                                      controller: _controller,
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.95,
                                      onLoaded: (composition) {
                                        _controller
                                          ..duration = composition.duration;
                                      },
                                      animate: false,
                                      repeat: true,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Visibility(
                                            visible: _isTyping,
                                            child: Lottie.asset(
                                              'assets/images/nwave.json',
                                              controller: _nwavecontroller,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.95,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.95,
                                              onLoaded: (composition) {
                                                _nwavecontroller
                                                  ..duration =
                                                      composition.duration
                                                  ..forward();
                                              },
                                              animate: false,
                                              repeat: true,
                                            ))),
                                  ),
                                ],
                              ),
                            ),
                            if (!isListing && !_isTyping) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(
                                  "Tap on mic to record your question.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Visibility(
                        visible: (ttsState == TtsState.playing ||
                            ttsState == TtsState.stopped ||
                            ttsState == TtsState.ready),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {

return;
                                print("fhdskl");
                                print("_isTyping");
                                print(_isTyping);
                                print(ttsState);
                                print(ttsState == TtsState.stopped);
                                if (_isTyping) {
                                  return;
                                }

                                if (ttsState == TtsState.stopped) {
                                  flutterTts.speak(cm.value.choices?[0].message?.content ??
                                      'Please reset and try again.');
                                  return;
                                }

                                if (ttsState == TtsState.playing) {
                                  flutterTts.stop();
                                  return;
                                }

                                flutterTts.speak(cm.value.choices?[0].message?.content ??
                                    'Please reset and try again.');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height:
                                    MediaQuery.of(context).size.width * 0.95,
                                child: Stack(
                                  children: [
                                    Lottie.asset(
                                      'assets/images/nwave.json',
                                      controller: _nwavecontroller,
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.95,
                                      onLoaded: (composition) {
                                        _nwavecontroller
                                          ..duration = composition.duration
                                          ..forward();
                                      },
                                      animate: false,
                                      repeat: true,
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // if (!(ttsState == TtsState.playing)) ...[
                            //   Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 30.0, vertical: 40),
                            //     child: Text(
                            //       "Tap play button to listen answer",
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(
                            //           fontSize: 20,
                            //           fontFamily: 'Poppins',
                            //           color: Colors.white),
                            //     ),
                            //   ),
                            // ],
                            if ((ttsState == TtsState.playing)) ...[
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Text(
                                      "Tap on pause button to pause answer",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Poppins',
                                          color: Colors.white),
                                    ),
                                  ),
                                  Lottie.asset(
                                    'assets/images/nnwave.json',
                                    controller: _controllerListening,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height:
                                        MediaQuery.of(context).size.width * 0.5,
                                    onLoaded: (composition) {
                                      _controllerListening
                                        ..duration = composition.duration
                                        ..forward();
                                    },
                                    animate: true,
                                    repeat: true,
                                  ),
                                ],
                              ),
                            ],
                            SizedBox(
                              height: 20,
                            ),
                            Visibility(
                              visible: false,
                              child: GestureDetector(
                                onTap: () async {
                                  await flutterTts.stop();
                                  isListing = false;
                                  _isTyping = false;
                                  ttsState = TtsState.reset;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Reset',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'Poppins',
                                        color: Color.fromRGBO(0, 111, 255, 1),
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.0),
                      if (isListing) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            "We are listening to your question. Tap again to submit question.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                color: Colors.white),
                          ),
                        ),
                      ],
                      if (_isTyping) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            "Wait, While we process your question and bring you the appropriate answer.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTooltip extends StatelessWidget {
  final Widget? child;
  final String? message;

  MyTooltip({@required this.message, @required this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}
