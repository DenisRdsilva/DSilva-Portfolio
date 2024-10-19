import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfol/views/home_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/standardButton.dart';
import '../../components/wordCloud.dart';
import '../../main.dart';
import '../constants.dart';

class HomeDesktop extends StatefulWidget {
  final double swidth;
  final double sheight;
  List<Projects> filteredProjects;
  bool mobileActive;
  void Function(String type) updateFilteredProjects;
  HomeDesktop(
      {super.key,
      required this.swidth,
      required this.sheight,
      required this.filteredProjects,
      required this.mobileActive,
      required this.updateFilteredProjects});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  int _currentIndex = 0;
  bool isVisible = true;
  bool expandPanel = false;
  bool showText = false;

  @override
  void initState() {
    super.initState();
    changeExpandedPanel();
    Future.delayed(const Duration(milliseconds: 100), () {
      Timer.periodic(const Duration(seconds: 5), (_) => _changeImage());
    });
  }

  void changeExpandedPanel() {
    Future.delayed(const Duration(milliseconds: 1000), (() {
      setState(() {
        expandPanel = true;
        Future.delayed(const Duration(milliseconds: 1000), (() {
          setState(() {
            showText = true;
          });
        }));
      });
    }));
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
      Image.asset(projectList[_currentIndex].imageLarge,
          fit: BoxFit.cover, width: widget.swidth * 5, height: widget.sheight),
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
      SizedBox(
        width: widget.swidth,
        height: widget.sheight,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: expandPanel ? true : false,
                  child: SizedBox(
                      width: widget.swidth * .4,
                      height: widget.sheight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: WordCloudWidget(
                              swidth: widget.swidth * .4,
                              sheight: widget.sheight,
                              filteredProjects: widget.updateFilteredProjects,
                              minValue: 20,
                              maxValue: 60,
                            ),
                          ),
                        ],
                      )),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: widget.sheight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  bottomLeft: Radius.circular(100)),
                              color: colorTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: expandPanel ? widget.swidth * .6 : 0,
                      // clipBehavior: ,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: widget.swidth * .6,
                            height: widget.sheight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorTheme.primary,
                              ),
                              transform: Matrix4.skewX(0.1),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                  minHeight: 200,
                                ),
                                width: widget.swidth * .6,
                                decoration: BoxDecoration(
                                  color: colorTheme.secondary,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.elliptical(200, 200)),
                                ),
                                child: Visibility(
                                  visible: showText ? true : false,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 125),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const CircleAvatar(
                                            radius: 80,
                                            backgroundImage:
                                                AssetImage('assets/me.jpg')),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Tooltip(
                                                message: "Clique para saber mais",
                                                child: InkWell(
                                                    onTap: () {
                                                      aboutMeModal(context, widget.swidth);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsets.only(right: 8.0),
                                                          child: Text("Sobre mim",
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                  fontFamily:
                                                                      "Raleway",
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                        Icon(Icons.more,
                                                            color: colorTheme.primary, size: 20),
                                                      ],
                                                    )),
                                              ),
                                              Wrap(
                                                children: [
                                                  Text('E-mail: ',
                                                      style: TextStyle(
                                                          fontFamily: "Raleway",
                                                          fontSize: 16,
                                                          color: colorTheme.primary,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Text(
                                                      'denisrsilva95@gmail.com',
                                                      style: TextStyle(
                                                          fontFamily: "Raleway",
                                                          fontSize: 16,
                                                          color: colorTheme.primary,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                               Wrap(
                                                children: [
                                                  Text('Número: ',
                                                      style: TextStyle(
                                                          fontFamily: "Raleway",
                                                          fontSize: 16,
                                                          color: colorTheme.primary,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Text('+55 (84) 99628-5407',
                                                      style: TextStyle(
                                                          fontFamily: "Raleway",
                                                          fontSize: 16,
                                                          color: colorTheme.primary,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: showText ? true : false,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: widget.swidth * .055),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                widget.filteredProjects =
                                                    projectList;
                                              });
                                            },
                                            child: standardButton(context,
                                                Icons.restart_alt, "Resetar")),
                                        TextButton(
                                            onPressed: () {
                                              changeVisibility();
                                              setState(() {
                                                widget.mobileActive = false;
                                              });
                                            },
                                            child: standardButton(context,
                                                Icons.monitor, "Desktop")),
                                        TextButton(
                                            onPressed: () {
                                              changeVisibility();
                                              setState(() {
                                                widget.mobileActive = true;
                                              });
                                            },
                                            child: standardButton(
                                                context,
                                                Icons.mobile_friendly,
                                                "Mobile")),
                                      ]),
                                ),
                              ),
                              Visibility(
                                visible: showText ? true : false,
                                child: Container(
                                  width: widget.swidth * .5,
                                  height: widget.sheight * .6,
                                  constraints:
                                      const BoxConstraints(maxWidth: 1000),
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 20),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      controller: ScrollController(),
                                      physics: const ScrollPhysics(),
                                      child: Wrap(
                                          spacing: 10,
                                          runSpacing: 10,
                                          children: [
                                            for (var project
                                                in widget.filteredProjects) ...{
                                              InkWell(
                                                  onTap: () {
                                                    final Uri url = Uri.parse(
                                                        project.urlSite);
                                                    launchUrl(url);
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      MouseRegion(
                                                          onEnter: (value) {
                                                            setState(() {
                                                              project.displayTitle =
                                                                  true;
                                                            });
                                                          },
                                                          onExit: (value) {
                                                            setState(() {
                                                              project.displayTitle =
                                                                  false;
                                                            });
                                                          },
                                                          child:
                                                              AnimatedContainer(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          1000),
                                                                  width: !widget
                                                                          .mobileActive
                                                                      ? 240
                                                                      : 130,
                                                                  height:
                                                                      !widget.mobileActive
                                                                          ? 130
                                                                          : 240,
                                                                  color: Colors
                                                                      .black12,
                                                                  child:
                                                                      Visibility(
                                                                    visible:
                                                                        isVisible,
                                                                    child: !widget
                                                                            .mobileActive
                                                                        ? Image.asset(project
                                                                            .imageDesktop)
                                                                        : Image.asset(
                                                                            project.imageMobile),
                                                                  ))),
                                                      if (project
                                                          .displayTitle) ...{
                                                        Material(
                                                            color: Colors
                                                                .black38,
                                                            child: AnimatedContainer(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                width: !widget
                                                                        .mobileActive
                                                                    ? 240
                                                                    : 130,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10),
                                                                child: Text(
                                                                    project
                                                                        .name,
                                                                    style: const TextStyle(
                                                                        fontFamily:
                                                                            "Raleway",
                                                                        color: Colors
                                                                            .white))))
                                                      } else ...{
                                                        const SizedBox()
                                                      },
                                                    ],
                                                  ))
                                            }
                                          ]),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: widget.sheight,
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            elevation: 10,
                            shape: const CircleBorder(eccentricity: 1),
                            child: IconButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(colorTheme.primary)),
                                onPressed: () {
                                  setState(() {
                                    if (expandPanel == true) {
                                      setState(() {
                                        showText = false;
                                      });
                                    } else {
                                      Future.delayed(
                                          const Duration(milliseconds: 1000),
                                          (() {
                                        setState(() {
                                          showText = true;
                                        });
                                      }));
                                    }
                                    expandPanel = !expandPanel;
                                  });
                                },
                                icon: AnimatedRotation(
                                    duration:
                                        const Duration(milliseconds: 1200),
                                    turns: expandPanel ? 0 : .5,
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: widget.swidth,
        height: widget.sheight,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              width: widget.swidth * .6,
              height: 50,
              decoration: BoxDecoration(
                color: colorTheme.secondary,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(75)),
              ),
              child: Center(
                child: Text('DSilva © 2024',
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 16,
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
