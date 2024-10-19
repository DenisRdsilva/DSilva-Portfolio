import 'package:flutter/material.dart';
import 'package:portfol/views/responsivity/home_desktop.dart';
import 'package:portfol/views/responsivity/home_mobile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'constants.dart';

void aboutMeModal(context, swidth) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 900),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text("SOBRE MIM",
                      style: TextStyle(
                          color: colorTheme.secondary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Raleway")),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var aboutMe in aboutMeList) ...{
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                aboutMe.title,
                                style: TextStyle(
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: colorTheme.secondary),
                              )),
                          for (var text in aboutMe.texts) ...{
                            Text(text, style: TextStyle(fontSize: 14, color: colorTheme.onPrimary)),
                          }
                        }
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool mobileActive = false;
  List<Projects> filteredProjects = projectList;

  void filterProjects(String type) {
    setState(() {
      filteredProjects =
          projectList.where((project) => project.type == type).toList();
    });
  }

  void updateFilteredProjects(String type) {
    filterProjects(type);
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldKey,
        body: Column(children: [
          if (swidth > 1200) ...{
            HomeDesktop(
              swidth: swidth,
              sheight: sheight,
              filteredProjects: filteredProjects,
              mobileActive: mobileActive,
              updateFilteredProjects: updateFilteredProjects,
            )
          } else ...{
            HomeMobile(
              swidth: swidth,
              sheight: sheight,
              filteredProjects: filteredProjects,
              mobileActive: mobileActive,
              updateFilteredProjects: updateFilteredProjects,
            )
          }
        ]));
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
