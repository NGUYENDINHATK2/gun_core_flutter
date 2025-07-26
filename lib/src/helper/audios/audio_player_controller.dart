import 'package:just_audio/just_audio.dart';

class AudioPlayerController {
  static final AudioPlayerController _instance = AudioPlayerController._internal();

  factory AudioPlayerController() => _instance;

  AudioPlayerController._internal();

  final AudioPlayer _player = AudioPlayer();
  String? currentId;

  AudioPlayer get player => _player;

  Future<void> play(String id, {required Future<void> Function() setupSource}) async {
    if (currentId != null && currentId != id) {
      await _player.stop();
    }

    currentId = id;

    await setupSource();
    await _player.play();
  }

  Future<void> stop() async {
    await _player.stop();
    currentId = null;
  }

  Future<void> pause() async {
    await _player.pause();
  }

  bool isPlaying(String id) {
    return currentId == id && _player.playing;
  }

  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  void dispose() {
    _player.dispose();
  }
}
