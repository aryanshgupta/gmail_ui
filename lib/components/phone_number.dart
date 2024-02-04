import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  List<String> countryNames = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "American Samoa",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Ascension Island",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Reunion",
    "Romania",
    "Russia",
    "Rwanda",
    "Vanuatu",
    "Vatican City",
    "Venezuela",
    "Vietnam",
    "Virgin Islands, British",
    "Virgin Islands, US",
    "Wallis and Futuna",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];

  late String countrySelected;

  @override
  void initState() {
    super.initState();
    countrySelected = countryNames[19];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 200.0,
          child: Text(
            "Phone numbers:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Text(
                "Default country code:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5.0),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  items: countryNames.map((String item) {
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
                  value: countrySelected,
                  onChanged: (value) {
                    setState(() {
                      countrySelected = value ?? countryNames[19];
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
        )
      ],
    );
  }
}
