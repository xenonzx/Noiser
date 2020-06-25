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
      NoiseModel("birds", 'assets/images/albatross-100.png', Colors.blue,
          'assets/audios/noiser_birds.mp3'),
    );
    noises.add(
      NoiseModel("bonfire", 'assets/images/bonfire-100-2.png', Colors.blue,
          'assets/audios/noiser_campfire.mp3'),
    );
    noises.add(
      NoiseModel("rain", 'assets/images/rain-100.png', Colors.blue,
          'assets/audios/noiser_rain.mp3'),
    );
    noises.add(
      NoiseModel("waterfall", 'assets/images/waterfall-100-2.png', Colors.blue,
          'assets/audios/noiser_waterfall.mp3'),
    );
    noises.add(
      NoiseModel("sea waves", 'assets/images/sun-and-sea-100.png', Colors.blue,
          'assets/audios/noiser_waves.mp3.mp3'),
    );
    noises.add(
      NoiseModel("night", 'assets/images/moon-and-stars-100.png', Colors.blue,
          'assets/audios/noiser_night.mp3'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noiser"),
      ),
      body: ListView(children: generateNoisesList(noises)),
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

Widget generateButton(NoiseModel noiseModel) {
  return FlatButton(
    padding: EdgeInsets.all(5.0),
    color: noiseModel.color,
    child: Image.asset(noiseModel.imagePath),
    onPressed: () {
      print("onpressed");
      noiseModel.player.playOrPause();
    },
  );
}

class NoiseModel {
  AssetsAudioPlayer player;
  Color color;
  String name;
  String imagePath;
  String audioUrl;
  NoiseModel(String name, String imagePath, Color color, String audioUrl) {
    this.name = name;
    this.imagePath = imagePath;
    this.color = color;
    this.audioUrl = audioUrl;
    this.player = AssetsAudioPlayer();
    player.open(
      Audio(audioUrl),
      autoStart: false,
    );
  }
}
