import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final List<String> languages = [
    "Afrikaans",
    "Azərbaycanca",
    "Bahasa Indonesia",
    "Bahasa Melayu",
    "Català",
    "Čeština",
    "Cymraeg",
    "Dansk",
    "Deutsch",
    "Eesti keel",
    "English (UK)",
    "English (US)",
    "Español",
    "Español (Latinoamérica)",
    "Euskara",
    "Filipino",
    "Français",
    "Français (Canada)",
    "Gaeilge",
    "Galego",
    "Hrvatski",
    "Italiano",
    "IsiZulu",
    "Íslenska",
    "Kiswahili",
    "Latviešu",
    "Lietuvių",
    "Magyar",
    "Norsk (Bokmål)",
    "Nederlands",
    "Polski",
    "Português (Brasil)",
    "Português (Portugal)",
    "Română",
    "Slovenčina",
    "Slovenščina",
    "Suomi",
    "Svenska",
    "Tiếng Việt",
    "Türkçe",
    "Ελληνικά",
    "Български",
    "Монгол",
    "Русский",
    "Српски",
    "Українська",
    "Հայերեն",
    "עברית",
    "اردو",
    "العربية",
    "فارسی",
    "नेपाली",
    "मराठी",
    "हिन्दी",
    "বাংলা",
    "ગુજરાતી",
    "தமிழ்",
    "తెలుగు",
    "ಕನ್ನಡ",
  ];

  late String languageSelected;

  @override
  void initState() {
    super.initState();
    languageSelected = languages[11];
  }

  TextDecoration clickableTextDecoration = TextDecoration.none;
  TextDecoration clickableTextDecoration2 = TextDecoration.none;

  bool canEnableInputTools = false;
  bool showAllLanguageOption = false;

  String selectedRtl = "offrtl";

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 200.0,
          child: Text(
            "Language:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Gmail display language:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      items: languages.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        );
                      }).toList(),
                      value: languageSelected,
                      onChanged: (value) {
                        setState(() {
                          languageSelected = value ?? languages[11];
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 24.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: Colors.black87,
                            width: 0.8,
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                        iconSize: 16.0,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.black,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 400.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(0.0),
                          thickness: MaterialStateProperty.all(10.0),
                        ),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 24.0,
                        selectedMenuItemBuilder: (context, child) {
                          return Container(
                            color: Theme.of(context).colorScheme.primary,
                            child: child,
                          );
                        },
                        overlayColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MouseRegion(
                onHover: (event) {
                  setState(() {
                    clickableTextDecoration = TextDecoration.underline;
                  });
                },
                onExit: (event) {
                  setState(() {
                    clickableTextDecoration = TextDecoration.none;
                  });
                },
                child: Text.rich(
                  TextSpan(
                    text: "Change language settings for other Google products",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launchUrl(
                          Uri.parse("https://myaccount.google.com/language"),
                        );
                      },
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: clickableTextDecoration,
                    decorationColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              if (!showAllLanguageOption)
                MouseRegion(
                  onHover: (event) {
                    setState(() {
                      clickableTextDecoration2 = TextDecoration.underline;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      clickableTextDecoration2 = TextDecoration.none;
                    });
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Show all language options",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            showAllLanguageOption = true;
                          });
                        },
                    ),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: clickableTextDecoration2,
                      decorationColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              if (showAllLanguageOption) ...[
                const SizedBox(height: 25.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: SizedBox(
                          height: 18.0,
                          width: 18.0,
                          child: Transform.scale(
                            scale: 0.8,
                            child: Checkbox(
                              splashRadius: 0.0,
                              value: canEnableInputTools,
                              onChanged: (value) {
                                setState(() {
                                  canEnableInputTools = !canEnableInputTools;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 8.0),
                      ),
                      const TextSpan(
                        text: "Enable input tools ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans",
                        ),
                      ),
                      const TextSpan(
                        text: " - Use various text input tools to type in the language of your choice - ",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                        ),
                      ),
                      TextSpan(
                        text: "Learn more",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: SizedBox(
                          height: 18.0,
                          width: 18.0,
                          child: Transform.scale(
                            scale: 0.8,
                            child: Radio(
                              splashRadius: 0.0,
                              value: "offrtl",
                              groupValue: selectedRtl,
                              onChanged: (value) {
                                setState(() {
                                  selectedRtl = "offrtl";
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 8.0),
                      ),
                      const TextSpan(
                        text: "Right-to-left editing support off",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: SizedBox(
                          height: 18.0,
                          width: 18.0,
                          child: Transform.scale(
                            scale: 0.8,
                            child: Radio(
                              splashRadius: 0.0,
                              value: "onrtl",
                              groupValue: selectedRtl,
                              onChanged: (value) {
                                setState(() {
                                  selectedRtl = "onrtl";
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 8.0),
                      ),
                      const TextSpan(
                        text: "Right-to-left editing support on",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        )
      ],
    );
  }
}
