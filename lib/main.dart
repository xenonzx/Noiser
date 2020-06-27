import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// TODO mute all
// TODO resume all that was playing
// TODO clean unwanted files

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
          'assets/audios/noiser_waves.mp3'),
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
    widgets.add(Noise(model));
  }
  return widgets;
}

class Noise extends StatefulWidget {
  NoiseModel noiseModel;
  Noise(this.noiseModel);
  @override
  _NoiseState createState() => _NoiseState(this.noiseModel);
}

class _NoiseState extends State<Noise> {
  NoiseModel noiseModel;
  _NoiseState(this.noiseModel);
  @override
  Widget build(BuildContext context) {
    print(noiseModel.volume);
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(fit: StackFit.loose, children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: FlatButton(
            color: noiseModel.color,
            child: Image.asset(noiseModel.imagePath),
            onPressed: () {
              print("onpressed");
              noiseModel.player.playOrPause();
            },
          ),
        ),
        Visibility(
          visible: true,
          child: Positioned(
            right: 0,
            child: Transform.rotate(
              angle: 3 * pi / 2,
              child: Slider(
                activeColor: Colors.white,
                inactiveColor: Colors.white,
                value: noiseModel.volume,
                onChanged: (newVal) {
                  print(newVal);
                  setState(() {
                    noiseModel.volume = newVal;
                  });
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class NoiseModel {
  static const double defaultVolume = 0.5;
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
    this.player = AssetsAudioPlayer.newPlayer();
    player.open(Audio(audioUrl), autoStart: false, volume: defaultVolume);
  }
  set volume(double v) {
    player.setVolume(v);
  }

  double get volume {
    return player.volume.value;
  }

  bool get isPlaying {
    return player.isPlaying.value;
  }
}
