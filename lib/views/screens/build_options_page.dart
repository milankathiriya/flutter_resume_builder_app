import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../utils/globals.dart';

class BuildOptionsPage extends StatefulWidget {
  const BuildOptionsPage({Key? key}) : super(key: key);

  @override
  State<BuildOptionsPage> createState() => _BuildOptionsPageState();
}

class _BuildOptionsPageState extends State<BuildOptionsPage> {
  final pw.Document pdf = pw.Document();

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

  generatePDF() async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("HELLO WORLD"),
          );
        },
      ),
    );

    // Directory? directory = await getExternalStorageDirectory();
    //
    // DateTime dateTime = DateTime.now();
    //
    // String pdfName = "resume${dateTime}.pdf";
    //
    // print("==============================");
    // File myPDF = File("${directory!.path}/$pdfName");
    // // /storage/emulated/0/Android/data/com.example.core_9am_resume_builder_app/files/resume2.pdf
    // await myPDF.writeAsBytes(await pdf.save());
    //
    // print(myPDF.path);
    // print("==============================");

    return pdf.save();
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
            icon: Icon(Icons.print),
            onPressed: () async {
              // generatePDF();
              await Printing.layoutPdf(
                onLayout: (format) => generatePDF(),
              );
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
