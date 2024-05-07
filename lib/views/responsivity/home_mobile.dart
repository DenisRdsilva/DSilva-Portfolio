// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/standardButton.dart';
import '../../components/wordCloud.dart';
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

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Stack(
        children: [
          Container(
              width: widget.swidth,
              height: widget.sheight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back1.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomLeft),
              )),
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
                        blurRadius: 5.0,
                        spreadRadius: 3.0,
                        offset: const Offset(2.0, 2.0),
                      )
                    ],
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: widget.swidth,
                  height: widget.sheight * .48,
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
                  transform: Matrix4.skewY(.01),
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
                      Padding(
                        padding: EdgeInsets.only(top: widget.sheight * .16),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: WordCloudWidget(
                              filteredProjects: widget.updateFilteredProjects,
                              sheight: widget.sheight * .35,
                              swidth: widget.swidth * .9,
                            ),
                          ),
                        ),
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
                                      !widget.mobileActive
                                          ? Container(
                                              width: 300,
                                              height: 160,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Image.asset(
                                                  project.imageDesktop),
                                            )
                                          : Container(
                                              width: 130,
                                              height: 240,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Image.asset(
                                                  project.imageMobile),
                                            ),
                                      Material(
                                          color: Colors.black38,
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              width: !widget.mobileActive
                                                  ? 300
                                                  : 130,
                                              child: Text(project.name,
                                                  style: const TextStyle(
                                                      fontFamily: "Raleway",
                                                      color: Colors.white))))
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
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 39, 28, 110),
                    borderRadius: BorderRadius.only(
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
                            child: const Text("Sobre mim",
                                style: TextStyle(
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        const SizedBox(width: 15),
                        // InkWell(
                        //     onTap: () {
                        //       showDialog(
                        //           context: context,
                        //           builder: ((context) {
                        //             return AlertDialog(
                        //               content: Column(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.center,
                        //                 children: [
                        //                   for (var word in wordList) ...{
                        //                     TextButton(
                        //                         onPressed: () {
                        //                           widget.updateFilteredProjects(
                        //                               word["word"]);
                        //                           Navigator.of(context).pop();
                        //                         },
                        //                         child: Text(word["word"],
                        //                             style: const TextStyle(
                        //                                 fontFamily:
                        //                                     "Raleway"))),
                        //                   }
                        //                 ],
                        //               ),
                        //             );
                        //           }));
                        //     },
                        //     child: const Text("Filtrar",
                        //         style: TextStyle(
                        //             fontFamily: "Raleway",
                        //             fontWeight: FontWeight.bold,
                        // color: Colors.white))),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 55,
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  Colors.transparent),
                            ),
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
              ],
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              width: widget.swidth * .6,
              height: 40,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 39, 28, 110),
                borderRadius: BorderRadius.only(topRight: Radius.circular(75)),
              ),
              child: const Center(
                child: Text('DSilva © 2024',
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 14,
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

void aboutMeModal(context, swidth) {
  showDialog(
      context: context,
      builder: ((context) {
        return const AlertDialog(
            content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CircleAvatar(
                    radius: 80, backgroundImage: AssetImage('assets/me.jpg')),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Dênis Silva é técnico em TI, com ênfase em informática para Internet e graduando em Sistemas para Internet, além de atuar como estagiário em Desenvolvimento Front-End na Velty.',
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('E-mail: denisrsilva95@gmail.com',
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                  Text('Número: +55 (84) 99628-5407',
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              )
            ]));
      }));
}
