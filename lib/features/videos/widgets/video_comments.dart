import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _startWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: _onClosePressed, icon: const Icon(Icons.close))
          ],
          title: const Text("3333 comments"),
          automaticallyImplyLeading: false,
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              ListView.separated(
                padding: const EdgeInsets.only(
                  top: Sizes.size16,
                  left: Sizes.size10,
                  right: Sizes.size10,
                  bottom: Sizes.size96 + Sizes.size20,
                ),
                itemCount: 10,
                separatorBuilder: (context, index) => Gaps.v40,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        child: Text("data"),
                      ),
                      Gaps.h10,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "data",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Gaps.v3,
                          const Text(
                              "datadatadatadatadatadatadatadatadatadatadatadata")
                        ],
                      )),
                      Gaps.h10,
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size24,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.v2,
                          Text(
                            "1.2K",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: BottomAppBar(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        child: Text("ghboo"),
                      ),
                      Gaps.h10,
                      Expanded(
                          child: TextField(
                        onTap: _startWriting,
                        minLines: null,
                        maxLines: null,
                        expands: true,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                            hintText: "Write a comment...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Sizes.size12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size10,
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const FaIcon(FontAwesomeIcons.at),
                                Gaps.h12,
                                const FaIcon(FontAwesomeIcons.gift),
                                Gaps.h12,
                                const FaIcon(FontAwesomeIcons.faceSmile),
                                Gaps.h12,
                                if (_isWriting)
                                  GestureDetector(
                                    onTap: _stopWriting,
                                    child: FaIcon(
                                      FontAwesomeIcons.circleArrowUp,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                if (_isWriting) Gaps.h12
                              ],
                            )),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
