import 'package:flutter/material.dart';

class Stars extends StatefulWidget {
  const Stars({super.key});

  @override
  State<Stars> createState() => _StarsState();
}

class _StarsState extends State<Stars> {
  final List<String> defaultPresetsInUse = [
    "assets/images/star_yellow.png",
  ];

  final List<String> defaultPresetsNotInUse = [
    "assets/images/star_orange.png",
    "assets/images/star_red.png",
    "assets/images/star_purple.png",
    "assets/images/star_blue.png",
    "assets/images/star_green.png",
    "assets/images/red_bang.png",
    "assets/images/orange_chevron.png",
    "assets/images/yellow_bang.png",
    "assets/images/green_check.png",
    "assets/images/blue_info.png",
    "assets/images/purple_question.png",
  ];

  late List<String> presetsInUse;
  late List<String> presetsNotInUse;

  @override
  void initState() {
    super.initState();
    presetsInUse = defaultPresetsInUse;
    presetsNotInUse = defaultPresetsNotInUse;
  }

  @override
  Widget build(BuildContext context) {
    print(presetsInUse.length);
    print(presetsNotInUse.length);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 200.0,
          child: Text(
            "Stars:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Drag the stars between the lists. ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    TextSpan(
                      text: "The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const SizedBox(
                    width: 100.0,
                    child: Text(
                      "Presets:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        presetsInUse = defaultPresetsInUse;
                        presetsNotInUse = defaultPresetsNotInUse;
                      });
                    },
                    child: Text(
                      "1 star",
                      style: TextStyle(
                        fontWeight: presetsInUse.length == 1 ? FontWeight.bold : FontWeight.normal,
                        color: presetsInUse.length == 1 ? Colors.black : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        presetsInUse = [];
                        presetsInUse.add(defaultPresetsInUse[0]);
                        presetsInUse.add(defaultPresetsNotInUse[3]);
                        presetsInUse.add(defaultPresetsNotInUse[8]);
                        presetsInUse.add(defaultPresetsNotInUse[5]);

                        presetsNotInUse = defaultPresetsNotInUse;
                        presetsNotInUse.remove(defaultPresetsNotInUse[3]);
                      });
                    },
                    child: Text(
                      "4 star",
                      style: TextStyle(
                        fontWeight: presetsInUse.length == 4 ? FontWeight.bold : FontWeight.normal,
                        color: presetsInUse.length == 4 ? Colors.black : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        presetsInUse = [];
                        presetsInUse.addAll(defaultPresetsInUse);
                        presetsInUse.addAll(defaultPresetsNotInUse);
                      });
                    },
                    child: Text(
                      "all stars",
                      style: TextStyle(
                        fontWeight: presetsInUse.length == 12 ? FontWeight.bold : FontWeight.normal,
                        color: presetsInUse.length == 12 ? Colors.black : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const SizedBox(
                    width: 100.0,
                    child: Text(
                      "In use:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...presetsInUse.map((imagePath) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(imagePath),
                    );
                  }).toList()
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const SizedBox(
                    width: 100.0,
                    child: Text(
                      "Not in use:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...presetsNotInUse.map((imagePath) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(imagePath),
                    );
                  }).toList()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
