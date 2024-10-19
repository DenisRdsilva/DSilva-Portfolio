// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfol/components/wordCloud.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/standardButton.dart';
import '../../main.dart';
import '../constants.dart';
import '../home_view.dart';

class HomeMobile extends StatefulWidget {
  final double swidth;
  final double sheight;
  List<Projects> filteredProjects;
  bool mobileActive;
  void Function(String type) updateFilteredProjects;
  HomeMobile(
      {super.key,
      required this.swidth,
      required this.sheight,
      required this.filteredProjects,
      required this.mobileActive,
      required this.updateFilteredProjects});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

List<double> padValues = [5, 3, 0, 2, 5, 0];
List<double> fontValues = [25, 16, 20, 17.5, 15, 17.5];

class _HomeMobileState extends State<HomeMobile> {
  int _currentIndex = 0;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      Timer.periodic(const Duration(seconds: 5), (_) => _changeImage());
    });
  }

  void _changeImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % projectList.length;
    });
  }

  void changeVisibility() {
    setState(() {
      isVisible = false;
    });
    Future.delayed(const Duration(milliseconds: 1500), (() {
      setState(() {
        isVisible = true;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: widget.sheight * .15),
            child: Image.asset(projectList[_currentIndex].imageDesktop,
                fit: BoxFit.cover,
                width: widget.swidth,
                height: widget.sheight * .4),
          ),
          Container(
            width: widget.swidth,
            height: widget.sheight,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black12,
                  Colors.black38,
                  Colors.black54,
                  Colors.black38,
                  Colors.black12
                ],
                    stops: [
                  .15,
                  .3,
                  .5,
                  .7,
                  .85
                ])),
          ),
          Container(
            height: widget.sheight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: widget.swidth,
                  height: widget.sheight * .15,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 3.0,
                        spreadRadius: 3.0,
                        offset: const Offset(2.0, 2.0),
                      )
                    ],
                    color: colorTheme.primary,
                  ),
                ),
                Container(
                  width: widget.swidth,
                  height: widget.sheight * .5,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 3.0,
                        spreadRadius: 3.0,
                        offset: const Offset(2.0, 2.0),
                      )
                    ],
                    color: colorTheme.primary,
                  ),
                  transform: Matrix4.skewY(-.04),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        width: widget.swidth,
        height: widget.sheight,
        child: SingleChildScrollView(
          controller: ScrollController(),
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: widget.sheight * .2),
                              child: Wrap(children: [
                                for (int i = 0; i < wordList.length; i++) ...{
                                  Padding(
                                    padding: EdgeInsets.all(padValues[i]),
                                    child: InkWell(
                                        onTap: () {
                                          widget.updateFilteredProjects(
                                              wordList[i]["word"]);
                                        },
                                        child: Text(wordList[i]["word"],
                                            style: TextStyle(
                                                shadows: const <Shadow>[
                                                  Shadow(
                                                    offset: Offset(3, 3),
                                                    blurRadius: 3.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  ),
                                                  Shadow(
                                                    offset: Offset(3, 3),
                                                    blurRadius: 8.0,
                                                    color: Color.fromARGB(
                                                        125, 0, 0, 255),
                                                  ),
                                                ],
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: fontValues[i],
                                                fontWeight: FontWeight.bold))),
                                  )
                                }
                              ]),
                            )),
                      ),
                      Container(
                        width: widget.swidth,
                        margin: const EdgeInsets.only(top: 30, bottom: 50),
                        child: Center(
                          child: Wrap(spacing: 10, runSpacing: 10, children: [
                            for (var project in widget.filteredProjects) ...{
                              InkWell(
                                  onTap: () {
                                    final Uri url = Uri.parse(project.urlSite);
                                    launchUrl(url);
                                  },
                                  child: Stack(
                                    children: [
                                      AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          width:
                                              !widget.mobileActive ? 300 : 130,
                                          height:
                                              !widget.mobileActive ? 160 : 240,
                                          color: Colors.black12,
                                          child: Visibility(
                                            visible: isVisible,
                                            child: !widget.mobileActive
                                                ? Image.asset(
                                                    project.imageDesktop)
                                                : Image.asset(
                                                    project.imageMobile),
                                          )),
                                      Material(
                                          color: Colors.black38,
                                          child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              width: !widget.mobileActive
                                                  ? 300
                                                  : 130,
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(project.name,
                                                  style: TextStyle(
                                                      fontFamily: "Raleway",
                                                      color: colorTheme.primary))))
                                    ],
                                  ))
                            }
                          ]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: widget.swidth,
        height: widget.sheight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                    maxWidth: 600,
                  ),
                  width: widget.swidth,
                  decoration: BoxDecoration(
                    color: colorTheme.secondary,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.elliptical(200, 200)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              aboutMeModal(context, widget.swidth);
                            },
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text("Sobre mim",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Raleway",
                                        color: colorTheme.primary)),
                              ),
                              Icon(Icons.more, color: colorTheme.primary, size: 16),
                              const SizedBox(width: 10)
                            ])),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: colorTheme.primary,
                  height: 60,
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {
                              setState(() {
                                widget.filteredProjects = projectList;
                              });
                            },
                            child: standardButton(
                                context, Icons.restart_alt, "Resetar")),
                        TextButton(
                            style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {
                              changeVisibility();
                              setState(() {
                                widget.mobileActive = false;
                              });
                            },
                            child: standardButton(
                                context, Icons.monitor, "Desktop")),
                        TextButton(
                            style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                            ),
                            onPressed: () {
                              changeVisibility();
                              setState(() {
                                widget.mobileActive = true;
                              });
                            },
                            child: standardButton(
                                context, Icons.mobile_friendly, "Mobile")),
                      ]),
                ),
              ],
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              width: widget.swidth * .6,
              height: 40,
              decoration: BoxDecoration(
                color: colorTheme.secondary,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(75)),
              ),
              child: Center(
                child: Text('DSilva © 2024',
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colorTheme.primary)),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}