import 'package:flutter/material.dart';

import '../../utils/globals.dart';

class BuildOptionsPage extends StatefulWidget {
  const BuildOptionsPage({Key? key}) : super(key: key);

  @override
  State<BuildOptionsPage> createState() => _BuildOptionsPageState();
}

class _BuildOptionsPageState extends State<BuildOptionsPage> {
  List<Map> allBuildOptions = [
    {
      'image': 'assets/images/contact_detail-removebg-preview (1).png',
      'title': 'Contact Info',
      'route': 'contact_info_page',
    },
    {
      'image': 'assets/images/briefcase.png',
      'title': 'Carrier Objective',
      'route': 'carrier_objective_page',
    },
    {
      'image': 'assets/images/account.png',
      'title': 'Personal Details',
      'route': 'personal_details_page',
    },
    {
      'image': 'assets/images/graduation-cap.png',
      'title': 'Education',
      'route': 'education_page',
    },
    {
      'image': 'assets/images/logical-thinking.png',
      'title': 'Experiences',
      'route': 'experiences_page',
    },
    {
      'image': 'assets/images/certificate.png',
      'title': 'Technical Skills',
      'route': 'technical_skills_page',
    },
    {
      'image': 'assets/images/open-book.png',
      'title': 'Interest/Hobbies',
      'route': 'interest_hobbies_page',
    },
    {
      'image': 'assets/images/project-management.png',
      'title': 'Projects',
      'route': 'projects_page',
    },
    {
      'image': 'assets/images/experience.png',
      'title': 'Achievements',
      'route': 'achievements_page',
    },
    {
      'image': 'assets/images/handshake.png',
      'title': 'References',
      'route': 'references_page',
    },
    {
      'image': 'assets/images/declaration.png',
      'title': 'Declaration',
      'route': 'declaration_page',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Workspace"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
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
              child: Text(
                "Build Options",
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
            child: SingleChildScrollView(
              child: Column(
                children: allBuildOptions.map((buildOption) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              buildOption['image'],
                              width: 40,
                            ),
                            const SizedBox(width: 30),
                            Text(
                              buildOption['title'],
                              style: TextStyle(fontSize: 20),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(buildOption['route']);
                              },
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
