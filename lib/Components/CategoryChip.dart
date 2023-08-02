import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryChip extends ConsumerWidget {
  CategoryChip({super.key, required this.label});
  String label;
  TextStyle ChipTextStyle = const TextStyle(
      color: Colors.black45, fontSize: 12.0, fontWeight: FontWeight.normal);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Chip(
        label: Text(
          label,
          style: ChipTextStyle,
        ),
        deleteButtonTooltipMessage: '');
  }
}
