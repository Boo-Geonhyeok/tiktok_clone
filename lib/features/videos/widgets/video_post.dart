import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final int index;
  const VideoPost({super.key, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayerController;

  late final AnimationController _animationController;

  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/aaa.mp4");
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    setState(() {});
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_videoPlayerController.value.isPlaying &&
        !_isPaused) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _videoPlayerController.pause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }

    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentTap(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const VideoComments(),
        isScrollControlled: true);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black45,
                  ),
          ),
          Positioned.fill(
              child: GestureDetector(
            onTap: _onTogglePause,
          )),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@ghboo",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    Text(
                      "12345678901234567890",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 25,
                  child: Text("ghboo"),
                ),
                Gaps.v24,
                const VideoButton(icon: FontAwesomeIcons.heart, text: "2.9M"),
                Gaps.v24,
                GestureDetector(
                    onTap: () => _onCommentTap(context),
                    child: const VideoButton(
                        icon: FontAwesomeIcons.solidComment, text: "33K")),
                Gaps.v24,
                const VideoButton(icon: FontAwesomeIcons.share, text: "Share"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
