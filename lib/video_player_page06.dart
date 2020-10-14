import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage06 extends StatefulWidget {
  VideoPlayerPage06({Key key}) : super(key: key);

  @override
  _VideoPlayerPage06State createState() => _VideoPlayerPage06State();
}

class _VideoPlayerPage06State extends State<VideoPlayerPage06> {
  VideoPlayerController _videoPlayerController;

  // 解码url
  String url =
      "https://v.360inhands.com/%E3%80%90iOS%E4%BB%8E%E5%85%A5%E9%97%A8%E5%88%B0%E6%94%BE%E5%BC%83%E3%80%91%E7%AC%AC%E4%B8%83%E5%9B%9E%20%E8%8E%B7%E5%8F%96%E6%96%87%E4%BB%B6%E8%A6%81%E4%BB%8E%E7%BD%91%E7%BB%9C%E4%B8%8B%E8%BD%BD%EF%BC%8C%E5%B1%95%E7%8E%B0%E6%95%B0%E6%8D%AE%E9%9C%80%E8%A6%81%E6%9C%AC%E5%9C%B0%E8%A7%A3%E6%9E%90%20-%201.1%28Av6497757%2CP1%29.mp4";
  bool _isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(url);
    _videoPlayerController.initialize().then((value) {
      // 界面重新渲染
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoPlayerController.value.initialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.blueAccent,
                      ),
                      onTap: () {
                        if (_isPlaying) {
                          _videoPlayerController.pause();
                        } else {
                          _videoPlayerController.play();
                        }
                        setState(() {
                          _isPlaying = !_isPlaying;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: Center(
                child: Text('加载中。。。'),
              ),
            ),
    );
  }
}
