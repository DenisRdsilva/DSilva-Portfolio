import 'package:flutter/material.dart';
import 'package:portfol/views/home_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/standardButton.dart';
import '../../components/wordCloud.dart';

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
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: widget.swidth,
          height: widget.sheight,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomLeft),
          )),
      Container(
        width: widget.swidth,
        height: widget.sheight,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          Colors.black12,
          Colors.black38,
          Colors.black54,
          Colors.black38,
          Colors.black12
        ], stops: [
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
                SizedBox(
                  width: widget.swidth * .4,
                    height: widget.sheight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        WordCloudWidget(
                          swidth: widget.swidth * .4,
                          sheight: widget.sheight,
                          filteredProjects: widget.updateFilteredProjects, minValue: 20, maxValue: 60,
                        ),
                      ],
                    )),
                Stack(
                  children: [
                    Container(
                      width: widget.swidth * .6,
                      height: widget.sheight,
                      constraints: const BoxConstraints(
                        maxWidth: 1000,
                      ),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 5.0,
                                  spreadRadius: 3.0,
                                  offset: const Offset(2.0, 2.0),
                                )
                              ],
                              color: Colors.white,
                            ),
                            transform: Matrix4.skewX(0.1),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minHeight: 200,
                            maxWidth: 1000,
                          ),
                          width: widget.swidth * .6,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 39, 28, 110),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(200, 200)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 125),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                    radius: 80,
                                    backgroundImage:
                                        AssetImage('assets/me.jpg')),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 75,
                                        width: widget.swidth * .35,
                                        child: const Text(
                                            "Dênis Silva é técnico em TI, com ênfase em informática para Internet e graduando em Sistemas para Internet, além de estagiar como Desenvolvedor Front-End na Velty.",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontFamily: "Raleway",
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      const Wrap(
                                        children: [
                                          Text('E-mail: ',
                                              style: TextStyle(
                                                  fontFamily: "Raleway",
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500)),
                                          Text('denisrsilva95@gmail.com',
                                              style: TextStyle(
                                                  fontFamily: "Raleway",
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      const Wrap(
                                        children: [
                                          Text('Número: ',
                                              style: TextStyle(
                                                  fontFamily: "Raleway",
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500)),
                                          Text('+55 (84) 99628-5407',
                                              style: TextStyle(
                                                  fontFamily: "Raleway",
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, right: widget.swidth * .055),
                          child: Row(children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.filteredProjects = projectList;
                                  });
                                },
                                child: standardButton(
                                    context, Icons.restart_alt, "Resetar")),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.mobileActive = false;
                                  });
                                },
                                child: standardButton(
                                    context, Icons.monitor, "Desktop")),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.mobileActive = true;
                                  });
                                },
                                child: standardButton(
                                    context, Icons.mobile_friendly, "Mobile")),
                          ]),
                        ),
                        Container(
                          width: widget.swidth * .5,
                          height: widget.sheight * .6,
                          constraints: const BoxConstraints(maxWidth: 1000),
                          padding: const EdgeInsets.only(top: 15, bottom: 20),
                          child: Center(
                            child: SingleChildScrollView(
                              controller: ScrollController(),
                              physics: const ScrollPhysics(),
                              child:
                                  Wrap(spacing: 10, runSpacing: 10, children: [
                                for (var project
                                    in widget.filteredProjects) ...{
                                  InkWell(
                                      onTap: () {
                                        final Uri url =
                                            Uri.parse(project.urlSite);
                                        launchUrl(url);
                                      },
                                      child: Stack(
                                        children: [
                                          MouseRegion(
                                            onEnter: (value) {
                                              setState(() {
                                                project.displayTitle = true;
                                              });
                                            },
                                            onExit: (value) {
                                              setState(() {
                                                project.displayTitle = false;
                                              });
                                            },
                                            child: !widget.mobileActive
                                                ? Container(
                                                    width: 240,
                                                    height: 130,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Image.asset(
                                                        project.imageDesktop),
                                                  )
                                                : Container(
                                                    width: 130,
                                                    height: 240,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Image.asset(
                                                        project.imageMobile),
                                                  ),
                                          ),
                                          if (project.displayTitle) ...{
                                            Material(
                                                color: Colors.black38,
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    width: !widget.mobileActive
                                                        ? 240
                                                        : 130,
                                                    child: Text(project.name,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Raleway",
                                                            color:
                                                                Colors.white))))
                                          } else ...{
                                            const SizedBox()
                                          },
                                        ],
                                      ))
                                }
                              ]),
                            ),
                          ),
                        )
                      ],
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
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 39, 28, 110),
                borderRadius: BorderRadius.only(topRight: Radius.circular(75)),
              ),
              child: const Center(
                child: Text('DSilva © 2024',
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
