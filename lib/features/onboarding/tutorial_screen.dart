import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: AnimatedCrossFade(
            firstChild: const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v52,
                  Text(
                    'Watch cool videos',
                    style: TextStyle(
                        fontSize: Sizes.size40, fontWeight: FontWeight.bold),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are specialized for you based on what you watch, like, and share.",
                    style: TextStyle(fontSize: Sizes.size20),
                  ),
                ],
              ),
            ),
            secondChild: const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v52,
                  Text(
                    'Watch cool Texts',
                    style: TextStyle(
                        fontSize: Sizes.size40, fontWeight: FontWeight.bold),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are specialized for you based on what you watch, like, and share.",
                    style: TextStyle(fontSize: Sizes.size20),
                  ),
                ],
              ),
            ),
            crossFadeState: _showingPage == Page.first
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
        ),
        bottomNavigationBar: AnimatedOpacity(
          opacity: _showingPage == Page.second ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: BottomAppBar(
            child: CupertinoButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              child: const Text("Enter the App"),
            ),
          ),
        ),
      ),
    );
  }
}
