import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_popup/flutter_popup.dart';

import 'textcolor_picker.dart';

class DefaultTextstyle extends StatefulWidget {
  const DefaultTextstyle({super.key});

  @override
  State<DefaultTextstyle> createState() => _DefaultTextStyleState();
}

class _DefaultTextStyleState extends State<DefaultTextstyle> {
  final List<String> fontList = [
    'Sans Serif',
    'Serif',
    'Fixed Width',
    'Wide',
    'Narrow',
    'Comic Sans MS',
    'Garamond',
    'Georgia',
    'Tahoma',
    'Trebuchet MS',
    'Verdana',
  ];

  final Map<String, double> fontSizeList = {
    'Small': 10.0,
    'Normal': 14.0,
    'Large': 18.0,
    'Huge': 30.0,
  };

  late String selectedFont;
  late String selectedFontSize;
  late Color selectedTextColor;

  @override
  void initState() {
    super.initState();
    selectedFont = fontList[0];
    selectedFontSize = fontSizeList.keys.toList()[1];
    selectedTextColor = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200.0,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Default text style:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                  ),
                ),
                TextSpan(
                  text: "\n(Use the 'Remove formatting' button on the toolbar to reset the default text style)",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: "OpenSans",
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 400.0,
          child: Card(
            surfaceTintColor: Colors.white,
            color: Colors.white,
            elevation: 3.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Tooltip(
                        message: "Font (Ctrl-Shift-5, Ctrl-Shift-6)",
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items: fontList.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: item,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                            value: selectedFont,
                            onChanged: (value) {
                              setState(() {
                                selectedFont = value ?? fontList[0];
                              });
                            },
                            customButton: Row(
                              children: [
                                const SizedBox(width: 2.5),
                                Text(
                                  selectedFont,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                            buttonStyleData: const ButtonStyleData(
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              padding: EdgeInsets.only(left: 5.0),
                            ),
                            dropdownStyleData: const DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              width: 200.0,
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              height: 30.0,
                              padding: const EdgeInsets.only(left: 55.0),
                              selectedMenuItemBuilder: (context, child) {
                                return Row(
                                  children: [
                                    const SizedBox(width: 15.0),
                                    const Icon(
                                      Icons.check_rounded,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 19.0),
                                    Text(
                                      selectedFont,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: selectedFont,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Tooltip(
                        message: "Size (Ctrl-Shift--, Ctrl-Shift-+)",
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items: fontSizeList.keys.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: fontSizeList[item],
                                  ),
                                ),
                              );
                            }).toList(),
                            customButton: Row(
                              children: [
                                const SizedBox(width: 2.5),
                                Icon(
                                  Icons.format_size,
                                  color: Colors.grey.shade700,
                                  size: 22.0,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                            value: selectedFontSize,
                            onChanged: (value) {
                              setState(() {
                                selectedFontSize = value ?? fontSizeList.keys.toList()[1];
                              });
                            },
                            buttonStyleData: const ButtonStyleData(
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            dropdownStyleData: const DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              width: 200.0,
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              height: 45.0,
                              padding: const EdgeInsets.only(left: 55.0),
                              selectedMenuItemBuilder: (context, child) {
                                return Row(
                                  children: [
                                    const SizedBox(width: 15.0),
                                    const Icon(
                                      Icons.check_rounded,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 19.0),
                                    Text(
                                      selectedFontSize,
                                      style: TextStyle(
                                        fontSize: fontSizeList[selectedFontSize],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                        child: VerticalDivider(
                          width: 0.1,
                        ),
                      ),
                      Tooltip(
                        message: "Text color",
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: CustomPopup(
                          content: TextColorPicker(
                            onChange: (color) {
                              setState(() {
                                selectedTextColor = color;
                              });
                            },
                          ),
                          barrierColor: Colors.transparent,
                          showArrow: false,
                          child: Row(
                            children: [
                              const SizedBox(width: 8.0),
                              Icon(
                                Icons.format_color_text_outlined,
                                color: Colors.grey.shade700,
                                size: 18.0,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey.shade700,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                        child: VerticalDivider(
                          width: 0.1,
                        ),
                      ),
                      Tooltip(
                        message: "Remove formatting (Ctrl-\\)",
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                selectedFont = fontList[0];
                                selectedFontSize = fontSizeList.keys.toList()[1];
                                selectedTextColor = Colors.black;
                              });
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.format_clear_outlined,
                              color: Colors.grey.shade700,
                              size: 22.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "This is what your body text will look like.",
                    style: TextStyle(
                      fontSize: fontSizeList[selectedFontSize],
                      fontFamily: selectedFont,
                      color: selectedTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
