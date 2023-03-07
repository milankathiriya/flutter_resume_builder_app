import 'dart:io';

import 'package:core_9am_resume_builder_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({Key? key}) : super(key: key);

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  int initialIndex = 0;

  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();

  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController.text = (Global.name != null) ? Global.name as String : "";
    emailController.text = (Global.email != null) ? Global.email as String : "";
    phoneController.text = (Global.phone != null) ? Global.phone as String : "";
    address1Controller.text =
        (Global.address1 != null) ? Global.address1 as String : "";
    address2Controller.text =
        (Global.address2 != null) ? Global.address2 as String : "";
    address3Controller.text =
        (Global.address3 != null) ? Global.address3 as String : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Workspace"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              contactFormKey.currentState!.reset();

              setState(() {
                nameController.clear();
                emailController.clear();
                phoneController.clear();
                address1Controller.clear();
                address2Controller.clear();
                address3Controller.clear();

                Global.name = null;
                Global.email = null;
                Global.phone = null;
                Global.address1 = null;
                Global.address2 = null;
                Global.address3 = null;
              });

              print(Global.name);
              print(Global.email);
              print(Global.phone);
              print(Global.address1);
              print(Global.address2);
              print(Global.address3);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        initialIndex = 0;
                      });
                    },
                    child: Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        initialIndex = 1;
                      });
                    },
                    child: Text(
                      "Photo",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            flex: 12,
            child: IndexedStack(
              index: initialIndex,
              children: [
                // contact layer
                Container(
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
                          key: contactFormKey,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  onSaved: (val) {
                                    Global.name = val;
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter name first...";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    prefixIcon: Icon(Icons.people),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: emailController,
                                  onSaved: (val) {
                                    Global.email = val;
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter email first...";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: phoneController,
                                  onSaved: (val) {
                                    Global.phone = val;
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter phone number first...";
                                    } else if (val.length != 10) {
                                      return "Enter 10 digits phone number...";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Phone",
                                    prefixIcon: Icon(Icons.phone),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: address1Controller,
                                  onSaved: (val) {
                                    Global.address1 = val;
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter address first...";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Address (Street, Building No.)",
                                    prefixIcon: Icon(Icons.location_on),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: address2Controller,
                                  onSaved: (val) {
                                    Global.address2 = val;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      hintText: "Address Line 2"),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: address3Controller,
                                  textInputAction: TextInputAction.done,
                                  onSaved: (val) {
                                    Global.address3 = val;
                                  },
                                  onFieldSubmitted: (val) {
                                    if (contactFormKey.currentState!
                                        .validate()) {
                                      contactFormKey.currentState!.save();

                                      print(Global.name);
                                      print(Global.email);
                                      print(Global.phone);
                                      print(Global.address1);
                                      print(Global.address2);
                                      print(Global.address3);
                                    } else {
                                      print("Invalid form...");
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Address Line 3"),
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
                // photo layer
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.all(25),
                      color: Colors.white,
                      width: 500,
                      height: 250,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey,
                              foregroundImage: (Global.image != null)
                                  ? FileImage(File(Global.image as String))
                                  : null,
                              child: Text("ADD"),
                            ),
                            FloatingActionButton(
                              mini: true,
                              child: Icon(Icons.add),
                              onPressed: () async {
                                showGeneralDialog(
                                  context: context,
                                  pageBuilder: (context, _, __) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: FlutterLogo(size: 300),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                child: Text("CAMERA"),
                                                onPressed: () async {
                                                  XFile? image =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .camera);

                                                  setState(() {
                                                    Global.image =
                                                        image!.path; // String
                                                  });

                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              ElevatedButton(
                                                child: Text("GALLERY"),
                                                onPressed: () async {
                                                  XFile? image =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);

                                                  setState(() {
                                                    Global.image =
                                                        image!.path; // String
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox.expand(
                                            child: ElevatedButton(
                                              child: Text("DISMISS"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
