import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';

class NavTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData icon;
  final Function onTap;

  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTap(),
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.25,
          duration: const Duration(milliseconds: 100),
          child: Column(
            children: [
              FaIcon(icon),
              Gaps.v5,
              Text(
                text,
              )
            ],
          ),
        ),
      ),
    );
  }
}
