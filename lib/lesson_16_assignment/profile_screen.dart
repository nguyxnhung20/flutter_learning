import 'package:flutter/material.dart';
import 'package:flutter_learning/lesson_16_assignment/avatar_and_username_section.dart';
import 'package:flutter_learning/lesson_16_assignment/custom_title_and_content_section.dart';
import 'package:flutter_learning/lesson_16_assignment/information_content.dart';
import 'package:flutter_learning/lesson_16_assignment/settings_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1B2332),
        title: const Text(
          "Profile Screen",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: const Color(0xff181F2B),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              AvatarAndUsernameSection(),
              SizedBox(
                height: 38,
              ),
              CustomTitleAndContentSection(
                  title: "Information", content: InformationContent()),
              SizedBox(
                height: 32,
              ),
              CustomTitleAndContentSection(
                  title: "Settings", content: SettingsContent()),
            ],
          ),
        ),
      ),
    );
  }
}
