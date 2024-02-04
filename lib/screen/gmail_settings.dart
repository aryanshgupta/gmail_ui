import 'package:flutter/material.dart';

import '../components/default_textstyle.dart';
import '../components/language.dart';
import '../components/phone_number.dart';
import '../components/signatures.dart';
import '../components/stars.dart';

class GmailSettingsScreen extends StatefulWidget {
  const GmailSettingsScreen({super.key});

  @override
  State<GmailSettingsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GmailSettingsScreen> {
  final List<String> tabLabels = [
    "General",
    "Labels",
    "Inbox",
    "Account and Import",
    "Filters and Blocked Addresses",
    "Forwarding and POP/IMAP",
    "Add-ons",
    "Chat and Meet",
    "Advanced",
    "Offline",
    "Themes",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabLabels.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Settings",
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: tabLabels.map((item) {
                return Tab(text: item);
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                children: const [
                  Language(),
                  Divider(),
                  PhoneNumber(),
                  Divider(),
                  DefaultTextstyle(),
                  Divider(),
                  Stars(),
                  Divider(),
                  Signatures(),
                  Divider(),
                ],
              ),
              ...tabLabels.sublist(1).map((item) {
                return Center(
                  child: Text("This is for $item"),
                );
              }).toList(),
            ],
          )),
    );
  }
}
