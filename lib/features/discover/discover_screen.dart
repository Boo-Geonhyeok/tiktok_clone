import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  void _onSearchChanged(String value) {}
  void _onSearchSubmitted(String value) {}
  void _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: CupertinoSearchTextField(
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: Sizes.size16),
            tabs: [
              for (var tab in tabs)
                GestureDetector(
                    onTap: () => _dismissKeyboard(context),
                    child: Tab(text: tab)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(Sizes.size6),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 9 / 20,
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                ),
                itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.size4),
                          ),
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: "assets/images/loggo.jpeg",
                                image:
                                    "https://imgnews.pstatic.net/image/413/2023/07/10/0000162685_001_20230711010501411.jpg?type=w647"),
                          ),
                        ),
                        Gaps.v8,
                        const Text(
                          "adasdadasdadasdadasdadasdadasdadasdadasdadasdaaaaaa",
                          style: TextStyle(
                            fontSize: Sizes.size16 + Sizes.size2,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gaps.v5,
                        DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 12,
                                child: Text("data"),
                              ),
                              Gaps.h4,
                              const Expanded(
                                child: Text(
                                  "usernaemusernaemusernaemusernaem",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Gaps.h4,
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size16,
                                color: Colors.grey.shade600,
                              ),
                              Gaps.h2,
                              const Text(
                                "1.2M",
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab),
              )
          ],
        ),
      ),
    );
  }
}
