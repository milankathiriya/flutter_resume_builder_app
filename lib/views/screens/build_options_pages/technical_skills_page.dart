import 'package:core_9am_resume_builder_app/utils/globals.dart';
import 'package:flutter/material.dart';

class TechnicalSkillsPage extends StatefulWidget {
  const TechnicalSkillsPage({Key? key}) : super(key: key);

  @override
  State<TechnicalSkillsPage> createState() => _TechnicalSkillsPageState();
}

class _TechnicalSkillsPageState extends State<TechnicalSkillsPage> {
  final GlobalKey<FormState> technicalSkillFormKey = GlobalKey<FormState>();

  List<TextEditingController> allFields = []; // 2

  @override
  void initState() {
    super.initState();
    allFields.add(TextEditingController());
    allFields.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technical Skills"),
        centerTitle: true,
        toolbarHeight: 120,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              allFields.forEach((e) {
                Global.technicalSkills.add(e.text);
              });

              print(Global.technicalSkills);

              Navigator.of(context).pop();
            }),
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
                key: technicalSkillFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Enter your skills",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      ...allFields.map((e) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: TextField(
                                controller: e,
                                decoration: InputDecoration(
                                  hintText: "C Programming",
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    allFields.remove(e);
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              child: Icon(Icons.add),
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {
                                setState(() {
                                  allFields.add(TextEditingController());
                                });
                              },
                            ),
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
