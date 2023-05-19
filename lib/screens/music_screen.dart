import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  List<String> audioFiles = [
    "audio/one.mp3",
    "audio/two.mp3",
    "audio/three.mp3",
    "audio/four.mp3",
    "audio/five.mp3",
    "audio/six.mp3",
  ];
  List<String> title = [
    "💜 All Eyes on Me",
    "💝 Apna bana le Piya",
    "💚 Eyes Closed Ringtone",
    "❤️ Interstellar Ringtone",
    "❤️‍🔥 Ek Tarfa",
    "💙 Kya Loge Tum",
  ];
  List<String> singer = [
    "Ed Sheeran",
    "Arijit Singh",
    "Ed Sheeran",
    "Hans Zimmer",
    "Darshan Raval",
    "BPraak | Jaani",
  ];

  int currentAudioIndex = 0;
  int totalAudioFiles = 1;

  @override
  void initState() {
    super.initState();
    totalAudioFiles = audioFiles.length;
    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    // audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    final player = AudioCache(prefix: "assets/");
    final url = await player.load(audioFiles[currentAudioIndex]);
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  void playNextAudio() async {
    currentAudioIndex = (currentAudioIndex + 1) % totalAudioFiles;
    await setAudio();
    await audioPlayer.resume();
  }

  void playPreviousAudio() async {
    currentAudioIndex = (currentAudioIndex - 1) % totalAudioFiles;
    if (currentAudioIndex < 0) {
      currentAudioIndex = totalAudioFiles - 1;
    }
    await setAudio();
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://w0.peakpx.com/wallpaper/925/81/HD-wallpaper-boy-listening-to-music-and-watching-nature-alone-headphones-artist-artwork-digital-art.jpg",
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                title[currentAudioIndex],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                singer[currentAudioIndex],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: playPreviousAudio,
                  ),
                  CircleAvatar(
                    radius: 35,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      iconSize: 50,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: playNextAudio,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
