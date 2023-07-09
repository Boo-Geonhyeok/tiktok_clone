import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => Container()), fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex == 0 ? false : true,
            child: const VideoTimeLineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex == 1 ? false : true,
            child: const Center(child: Text("2")),
          ),
          Offstage(
            offstage: _selectedIndex == 2 ? false : true,
            child: const Center(child: Text("3")),
          ),
          Offstage(
            offstage: _selectedIndex == 3 ? false : true,
            child: const Center(child: Text("4")),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              text: "Home",
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTab(
              text: "Discover",
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: const PostVideoButton(),
            ),
            Gaps.h24,
            NavTab(
              text: "Inbox",
              icon: FontAwesomeIcons.inbox,
              isSelected: _selectedIndex == 2,
              onTap: () => _onTap(2),
            ),
            NavTab(
              text: "Profile",
              icon: FontAwesomeIcons.user,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
