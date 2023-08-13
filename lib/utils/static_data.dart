import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final Widget icon;

  Category({required this.id, required this.title, required this.icon});
}

class StaticData {
  static List<Category> categories = [
    Category(
      id: 1,
      title: "Most Popular",
      icon: const Icon(
        LineIcons.fire,
      ),
    ),
    Category(
      id: 2,
      title: "World",
      icon: const Icon(
        LineIcons.globe,
      ),
    ),
    Category(
      id: 3,
      title: "Science",
      icon: const Icon(
        LineIcons.react,
      ),
    ),
    Category(
      id: 4,
      title: "Politics",
      icon: SvgPicture.asset("assets/svg/politics.svg"),
    ),
    Category(
      id: 5,
      title: "Business",
      icon: const Icon(LineIcons.handshake),
    ),
    Category(
      id: 6,
      title: "Sports",
      icon: const Icon(LineIcons.circle),
    ),
    Category(
      id: 7,
      title: "Arts",
      icon: SvgPicture.asset("assets/svg/arts.svg"),
    ),
    Category(
      id: 8,
      title: "Health",
      icon: const Icon(LineIcons.stethoscope),
    ),
    Category(
      id: 9,
      title: "Food",
      icon: SvgPicture.asset("assets/svg/food.svg"),
    ),
    Category(
      id: 10,
      title: "Tech",
      icon: SvgPicture.asset("assets/svg/technology.svg"),
    ),
  ];
}
