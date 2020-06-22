import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// TODO mute all
// TODO resume all that was playing
//
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noiser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SoundsPage(),
    );
  }
}

class SoundsPage extends StatefulWidget {
  @override
  _SoundsPageState createState() => _SoundsPageState();
}

class _SoundsPageState extends State<SoundsPage> {
  List<NoiseModel> noises;
  _SoundsPageState() {
    noises = List<NoiseModel>();
    noises.add(
      NoiseModel(Colors.blue, 'assets/audios/cave_river.mp3'),
    );
    noises.add(
      NoiseModel(Colors.red, 'assets/audios/river.wav'),
    );
    noises.add(
      NoiseModel(Colors.green, 'assets/audios/stream.wav'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noiser"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: generateNoisesList(noises)),
    );
  }
}

List<Widget> generateNoisesList(List<NoiseModel> models) {
  List<Widget> widgets = List<Widget>();
  for (var model in models) {
    widgets.add(generateButton(model));
  }
  return widgets;
}

FlatButton generateButton(NoiseModel noiseModel) {
  return FlatButton(
    padding: EdgeInsets.all(5.0),
    color: noiseModel.color,
    onPressed: () {
      print("onpressed");
      noiseModel.player.playOrPause();
    },
  );
}

class NoiseModel {
  AssetsAudioPlayer player;
  Color color;
  String audioUrl;
  NoiseModel(Color color, String audioUrl) {
    this.color = color;
    this.audioUrl = audioUrl;
    this.player = AssetsAudioPlayer();
    player.open(
      Audio(audioUrl),
      autoStart: false,
    );
  }
}
