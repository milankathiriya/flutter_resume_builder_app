import 'package:core_9am_resume_builder_app/views/screens/build_options_page.dart';
import 'package:core_9am_resume_builder_app/views/screens/build_options_pages/contact_info_page.dart';
import 'package:core_9am_resume_builder_app/views/screens/build_options_pages/declaration_page.dart';
import 'package:core_9am_resume_builder_app/views/screens/build_options_pages/personal_details_page.dart';
import 'package:core_9am_resume_builder_app/views/screens/build_options_pages/technical_skills_page.dart';
import 'package:core_9am_resume_builder_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'build_options_page': (context) => const BuildOptionsPage(),
        'contact_info_page': (context) => const ContactInfoPage(),
        // 'carrier_objective_page': (context) => ,
        'personal_details_page': (context) => PersonalDetailsPage(),
        // 'education_page': (context) => ,
        // 'experiences_page': (context) => ,
        'technical_skills_page': (context) => TechnicalSkillsPage(),
        // 'interest_hobbies_page': (context) => ,
        // 'projects_page': (context) => ,
        // 'achievements_page': (context) => ,
        // 'references_page': (context) => ,
        'declaration_page': (context) => DeclarationPage(),
      },
    ),
  );
}
