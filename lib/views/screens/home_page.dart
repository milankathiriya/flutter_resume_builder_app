import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCountry;
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text("Exit from App"),
              ),
              content: Text("Are you sure to want to exit?"),
              actions: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Yes"),
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Resume Builder"),
          centerTitle: true,
          elevation: 0,
          actions: [
            PopupMenuButton(
              initialValue: selectedItem,
              onSelected: (val) {
                setState(() {
                  selectedItem = val;
                });
              },
              offset: Offset(0, 50),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text("First"),
                    value: "First",
                  ),
                  PopupMenuItem(
                    child: Text("Second"),
                    value: "Second",
                  ),
                  PopupMenuItem(
                    child: Text("Third"),
                    value: "Third",
                  ),
                ];
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed('build_options_page');
          },
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                child: Text(
                  "RESUMES",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
            Expanded(
              flex: 12,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.asset(
                    "assets/images/open-cardboard-box.png",
                    width: 60,
                  ),
                  Text(
                    "No Resumes + Create new resume",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 60),
                  Text(
                    "$selectedCountry",
                    style: TextStyle(fontSize: 24),
                  ),
                  DropdownButton<String>(
                    value: selectedCountry,
                    hint: Text("Select any country..."),
                    items: [
                      DropdownMenuItem(
                        child: Text("India"),
                        value: "India",
                      ),
                      DropdownMenuItem(
                        child: Text("USA"),
                        value: "USA",
                      ),
                      DropdownMenuItem(
                        child: Text("Russia"),
                        value: "Russia",
                      ),
                    ],
                    onChanged: (val) {
                      setState(() {
                        selectedCountry = val!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
