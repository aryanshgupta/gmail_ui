import 'package:flutter/material.dart';

class TextColorPicker extends StatefulWidget {
  final void Function(Color color) onChange;
  const TextColorPicker({super.key, required this.onChange});

  @override
  State<TextColorPicker> createState() => _TextColorPickerState();
}

class _TextColorPickerState extends State<TextColorPicker> {
  final List<Color> blackShades = [
    const Color(0xff000000),
    const Color(0xff444444),
    const Color(0xff666666),
    const Color(0xff999999),
    const Color(0xffcccccc),
    const Color(0xffeeeeee),
    const Color(0xfff3f3f3),
    const Color(0xffffffff),
  ];

  final List<Color> primaryShades = [
    const Color(0xffff0000),
    const Color(0xffff9900),
    const Color(0xffffff00),
    const Color(0xff00ff00),
    const Color(0xff00ffff),
    const Color(0xff0000ff),
    const Color(0xff9900ff),
    const Color(0xffff00ff),
  ];

  final List<Color> primaryShades1 = [
    const Color(0xfff4cccc),
    const Color(0xfffce5cd),
    const Color(0xfffff2cc),
    const Color(0xffd9ead3),
    const Color(0xffd0e0e3),
    const Color(0xffcfe2f3),
    const Color(0xffd9d2e9),
    const Color(0xffead1dc),
  ];

  final List<Color> primaryShades2 = [
    const Color(0xffea9999),
    const Color(0xfff9cb9c),
    const Color(0xffffe599),
    const Color(0xffb6d7a8),
    const Color(0xffa2c4c9),
    const Color(0xff9fc5e8),
    const Color(0xffb4a7d6),
    const Color(0xffd5a6bd),
  ];

  final List<Color> primaryShades3 = [
    const Color(0xffe06666),
    const Color(0xfff6b26b),
    const Color(0xffffd966),
    const Color(0xff93c47d),
    const Color(0xff76a5af),
    const Color(0xff6fa8dc),
    const Color(0xff8e7cc3),
    const Color(0xffc27ba0),
  ];

  final List<Color> primaryShades4 = [
    const Color(0xffcc0000),
    const Color(0xffe69138),
    const Color(0xfff1c232),
    const Color(0xff6aa84f),
    const Color(0xff45818e),
    const Color(0xff3d85c6),
    const Color(0xff674ea7),
    const Color(0xffa64d79),
  ];

  final List<Color> primaryShades5 = [
    const Color(0xff990000),
    const Color(0xffb45f06),
    const Color(0xffbf9000),
    const Color(0xff38761d),
    const Color(0xff134f5c),
    const Color(0xff0b5394),
    const Color(0xff351c75),
    const Color(0xff741b47),
  ];

  final List<Color> primaryShades6 = [
    const Color(0xff660000),
    const Color(0xff783f04),
    const Color(0xff7f6000),
    const Color(0xff274e13),
    const Color(0xff0c343d),
    const Color(0xff073763),
    const Color(0xff20124d),
    const Color(0xff4c1130),
  ];

  late Color selectedTextColor;

  Widget colorShades(List<Color> colors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: colors.map((color) {
        bool isColorSelected = selectedTextColor == color;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTextColor = color;
            });
            widget.onChange(selectedTextColor);
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isColorSelected ? Colors.black : Colors.white,
              ),
            ),
            child: Container(
              height: 18.0,
              width: 18.0,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: isColorSelected ? Image.asset("assets/images/checkmark.png") : null,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    selectedTextColor = blackShades.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Text color"),
        const SizedBox(height: 10.0),
        colorShades(blackShades),
        const SizedBox(height: 5.0),
        colorShades(primaryShades),
        const SizedBox(height: 5.0),
        colorShades(primaryShades1),
        colorShades(primaryShades2),
        colorShades(primaryShades3),
        colorShades(primaryShades4),
        colorShades(primaryShades5),
        colorShades(primaryShades6),
      ],
    );
  }
}
