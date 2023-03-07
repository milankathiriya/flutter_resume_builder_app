import 'dart:io';

import 'package:core_9am_resume_builder_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final GlobalKey<FormState> personalDetailFormKey = GlobalKey<FormState>();

  final TextEditingController dobController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dobController.text = (Global.dob != null) ? Global.dob as String : "";
    nationalityController.text =
        (Global.nationality != null) ? Global.nationality as String : "";
  }

  TextStyle titleStyle = TextStyle(
    color: Colors.blue,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Details"),
        centerTitle: true,
        toolbarHeight: 120,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              personalDetailFormKey.currentState!.reset();

              setState(() {
                dobController.clear();
                nationalityController.clear();

                Global.dob = null;
                Global.nationality = null;
              });

              print(Global.dob);
              print(Global.nationality);
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(25),
              color: Colors.white,
              width: 500,
              child: Form(
                key: personalDetailFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DOB", style: titleStyle),
                      TextFormField(
                        controller: dobController,
                        onSaved: (val) {
                          Global.dob = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter DOB first...";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "DD/MM/YYYY",
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text("Marital Status", style: titleStyle),
                      RadioListTile(
                        title: Text("Single"),
                        value: "Single",
                        groupValue: Global.maritalStatus, // marital_status
                        onChanged: (val) {
                          setState(() {
                            Global.maritalStatus = val!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Married"),
                        value: "Married",
                        groupValue: Global.maritalStatus,
                        onChanged: (val) {
                          setState(() {
                            Global.maritalStatus = val!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Text("Languages Known", style: titleStyle),
                      CheckboxListTile(
                        title: Text("English"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: Global.isEnglish,
                        onChanged: (val) {
                          setState(() {
                            Global.isEnglish = val!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Hindi"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: Global.isHindi,
                        onChanged: (val) {
                          setState(() {
                            Global.isHindi = val!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Gujartai"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: Global.isGujarati,
                        onChanged: (val) {
                          setState(() {
                            Global.isGujarati = val!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Text("Nationality", style: titleStyle),
                      TextFormField(
                        controller: nationalityController,
                        onSaved: (val) {
                          Global.nationality = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter nationality first...";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Indian",
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text("SAVE"),
                            onPressed: () {
                              if (personalDetailFormKey.currentState!
                                  .validate()) {
                                personalDetailFormKey.currentState!.save();

                                print(Global.dob);
                                print(Global.nationality);
                              } else {
                                print("Invalid form...");
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
