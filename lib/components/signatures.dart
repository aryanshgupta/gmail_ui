import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'add_edit_signature.dart';

class Signatures extends StatefulWidget {
  const Signatures({super.key});

  @override
  State<Signatures> createState() => _SignaturesState();
}

class _SignaturesState extends State<Signatures> {
  TextDecoration clickableTextDecoration = TextDecoration.none;

  List<String> signatures = [];
  String? selectedSignature;

  Map<String, String> signatureOptions = {
    "signForNewEmail": "No signature",
    "signForReplyNForword": "No signature",
  };

  bool insertSignatureBeforeQuoted = false;

  void addEditSignDialog({String? sign}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: SizedBox(
            width: 500.0,
            child: AddEditSignature(
              onSubmit: (value) {
                setState(() {
                  if (sign == null) {
                    signatures.add(value);
                    selectedSignature = value;
                  } else {
                    int index = signatures.indexOf(sign);
                    signatures[index] = value;
                    selectedSignature = value;
                  }
                });
              },
              sign: sign,
            ),
          ),
        );
      },
    );
  }

  Widget createNewSign({double? width}) {
    return SizedBox(
      width: width,
      child: TextButton.icon(
        onPressed: () {
          addEditSignDialog();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              side: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
        icon: const Icon(
          Icons.add,
          size: 20.0,
        ),
        label: const Text(
          "Create new",
        ),
      ),
    );
  }

  Widget signDropdownMenu(String selectedSignOption) {
    List<String> newSignatures = [];

    newSignatures.add("No signature");
    newSignatures.addAll(signatures);

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: newSignatures.map((String item) {
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
        value: signatureOptions[selectedSignOption],
        onChanged: (value) {
          setState(() {
            signatureOptions[selectedSignOption] = value ?? "No signature";
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200.0,
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Signature:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                  ),
                ),
                const TextSpan(
                  text: "\n(appended at the end of all outgoing messages)\n",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: "OpenSans",
                  ),
                ),
                WidgetSpan(
                  child: MouseRegion(
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
                        text: "Learn more",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(
                              Uri.parse("https://support.google.com/mail/answer/8395?hl=en"),
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
                ),
              ],
            ),
          ),
        ),
        if (signatures.isEmpty)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "No signatures",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                createNewSign(),
              ],
            ),
          ),
        if (signatures.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                child: Container(
                  height: 200.0,
                  width: 800.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 200.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: ListView(
                          children: signatures.map((sign) {
                            bool isTileSelected = selectedSignature == sign;
                            return SizedBox(
                              height: 40.0,
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    selectedSignature = sign;
                                  });
                                },
                                dense: true,
                                title: Text(
                                  sign,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                tileColor: isTileSelected ? Colors.blue.shade50 : null,
                                trailing: isTileSelected
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              addEditSignDialog(sign: sign);
                                            },
                                            icon: Image.asset(
                                              "assets/images/edit.png",
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              "assets/images/delete.png",
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                        ],
                                      )
                                    : null,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              createNewSign(width: 250.0),
              const SizedBox(height: 30.0),
              const Text(
                "Signature defaults",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  fontFamily: "OpenSans",
                ),
              ),
              const SizedBox(height: 15.0),
              // dropdown menu labels
              const Row(
                children: [
                  SizedBox(
                    width: 175.0,
                    child: Text(
                      "FOR NEW EMAILS USE",
                      style: TextStyle(
                        fontSize: 11.0,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  SizedBox(
                    width: 175.0,
                    child: Text(
                      "ON REPLY/FORWARD USE",
                      style: TextStyle(
                        fontSize: 11.0,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              // sign selection from dropdown menu
              Row(
                children: [
                  SizedBox(
                    width: 175.0,
                    child: signDropdownMenu("signForNewEmail"),
                  ),
                  const SizedBox(width: 15.0),
                  SizedBox(
                    width: 175.0,
                    child: signDropdownMenu("signForReplyNForword"),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
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
                            value: insertSignatureBeforeQuoted,
                            onChanged: (value) {
                              setState(() {
                                insertSignatureBeforeQuoted = !insertSignatureBeforeQuoted;
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
                      text: "Insert signature before quoted text in replies and remove the \"--\" line that precedes it.",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
