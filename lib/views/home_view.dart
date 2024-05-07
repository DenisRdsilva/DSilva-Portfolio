import 'package:flutter/material.dart';
import 'package:portfol/views/responsivity/home_desktop.dart';
import 'package:portfol/views/responsivity/home_mobile.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects {
  final String name;
  final String type;
  final String imageDesktop;
  final String imageMobile;
  final String urlSite;
  bool displayTitle;

  Projects(
      {required this.name,
      required this.type,
      required this.imageDesktop,
      required this.imageMobile,
      required this.urlSite,
      required this.displayTitle});
}

List<Projects> projectList = [
  Projects(
      name: "Psicóloga Alice Medeiros",
      type: "Dart/Flutter",
      imageDesktop: "assets/projects/psialice.jpeg",
      imageMobile: "assets/projects/psialicemob.jpeg",
      displayTitle: false,
      urlSite: 'https://psialicemedeiros.web.app/#/'),
  Projects(
      name: "Daniel Oli Fotografias",
      type: "Dart/Flutter",
      imageDesktop: "assets/projects/danieloli.jpeg",
      imageMobile: "assets/projects/danielolimob.jpeg",
      displayTitle: false,
      urlSite: 'https://ddanieolifotos.vercel.app/'),
  Projects(
      name: "PEX Delivery de Construção",
      type: "Javascript/ReactJS",
      imageDesktop: "assets/projects/pex.jpeg",
      imageMobile: "assets/projects/pexmob.jpeg",
      displayTitle: false,
      urlSite: 'https://pex-web-sj3g.vercel.app/'),
  Projects(
      name: "Loja de Cristais",
      type: "Dart/Flutter",
      imageDesktop: "assets/projects/crystalshop.jpeg",
      imageMobile: "assets/projects/crystalshopmob.jpeg",
      displayTitle: false,
      urlSite: 'https://crystalonlineshop-695ec.web.app/#/'),
  Projects(
      name: "Blog de Texto (Cidades)",
      type: "Javascript/Vanilla",
      imageDesktop: "assets/projects/citiesblog.jpeg",
      imageMobile: "assets/projects/citiesblogmob.jpeg",
      displayTitle: false,
      urlSite: 'https://textblog-fd684.web.app/index.html'),
  Projects(
      name: "Pokedex",
      type: "Typescript/NextJS",
      imageDesktop: "assets/projects/pokedex.jpeg",
      imageMobile: "assets/projects/pokedexmob.jpeg",
      displayTitle: false,
      urlSite: 'https://denisrdsilva.github.io/Pokedex/'),
  Projects(
      name: "Biblioteca de Livros",
      type: "Typescript/NodeJS",
      imageDesktop: "assets/projects/books.jpeg",
      imageMobile: "assets/projects/booksmob.jpeg",
      displayTitle: false,
      urlSite: 'https://registeringbooks.web.app/'),
  Projects(
      name: "Calculadora Básica",
      type: "Javascript/NodeJS",
      imageDesktop: "assets/projects/calc.jpeg",
      imageMobile: "assets/projects/calcmob.jpeg",
      displayTitle: false,
      urlSite: 'https://basicalculatormath.web.app/'),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
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