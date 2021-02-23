import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BeyazShowVideoPlayer extends StatefulWidget {
  String src;
  BeyazShowVideoPlayer(this.src);
  @override
  _BeyazShowVideoPlayerState createState() => _BeyazShowVideoPlayerState();
}

class _BeyazShowVideoPlayerState extends State<BeyazShowVideoPlayer> {
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.src),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
          showVideoProgressIndicator: true,
          onReady: () {
            _controller.addListener(listener);
          },
        ),
        builder: (context, player) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: player,
              ),
            ],
          );
        },
      )),
    );
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }
}
