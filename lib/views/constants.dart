class Projects {
  final String name;
  final String type;
  final String imageDesktop;
  final String imageLarge;
  final String imageMobile;
  final String urlSite;
  bool displayTitle;

  Projects(
      {required this.name,
      required this.type,
      required this.imageDesktop,
      required this.imageLarge,
      required this.imageMobile,
      required this.urlSite,
      required this.displayTitle});
}

List<Projects> projectList = [
  Projects(
      name: "Psicóloga Alice Medeiros",
      type: "Dart/Flutter",
      imageDesktop: "assets/projects/psialice.jpeg",
      imageLarge: "assets/projects/psialiceGG.jpeg",
      imageMobile: "assets/projects/psialicemob.jpeg",
      displayTitle: false,
      urlSite: 'https://psialicemedeiros.web.app/#/'),
  Projects(
      name: "Daniel Oli Fotografias",
      type: "Dart/Flutter",
      imageDesktop: "assets/projects/danieloli.jpeg",
      imageLarge: "assets/projects/danieloliGG.jpeg",
      imageMobile: "assets/projects/danielolimob.jpeg",
      displayTitle: false,
      urlSite: 'https://ddanieolifotos.vercel.app/'),
  Projects(
      name: "PEX Delivery de Construção (Velty)",
      type: "Javascript/ReactJS",
      imageDesktop: "assets/projects/pex.jpeg",
      imageLarge: "assets/projects/pexGG.jpeg",
      imageMobile: "assets/projects/pexmob.jpeg",
      displayTitle: false,
      urlSite: 'https://pex-web-sj3g.vercel.app/'),
  Projects(
      name: "Loja de Cristais",
      type: "Dart/Flutter",
      imageDesktop: "assets/projects/crystalshop.jpeg",
      imageLarge: "assets/projects/crystalGG.jpeg",
      imageMobile: "assets/projects/crystalshopmob.jpeg",
      displayTitle: false,
      urlSite: 'https://crystalonlineshop-695ec.web.app/#/'),
  Projects(
      name: "Blog de Texto (Cidades)",
      type: "Javascript",
      imageDesktop: "assets/projects/citiesblog.jpeg",
      imageLarge: "assets/projects/citiesGG.jpeg",
      imageMobile: "assets/projects/citiesblogmob.jpeg",
      displayTitle: false,
      urlSite: 'https://textblog-fd684.web.app/index.html'),
  Projects(
      name: "Pokedex",
      type: "Typescript/NextJS",
      imageDesktop: "assets/projects/pokedex.jpeg",
      imageLarge: "assets/projects/pokedexGG.jpeg",
      imageMobile: "assets/projects/pokedexmob.jpeg",
      displayTitle: false,
      urlSite: 'https://denisrdsilva.github.io/Pokedex/'),
  Projects(
      name: "Biblioteca de Livros",
      type: "Typescript/NodeJS",
      imageDesktop: "assets/projects/books.jpeg",
      imageLarge: "assets/projects/booksGG.jpeg",
      imageMobile: "assets/projects/booksmob.jpeg",
      displayTitle: false,
      urlSite: 'https://registeringbooks.web.app/'),
  Projects(
      name: "Calculadora Básica",
      type: "Javascript/NodeJS",
      imageDesktop: "assets/projects/calc.jpeg",
      imageLarge: "assets/projects/calcGG.jpeg",
      imageMobile: "assets/projects/calcmob.jpeg",
      displayTitle: false,
      urlSite: 'https://basicalculatormath.web.app/'),
  Projects(
      name: "Fio Soul (Velty)",
      type: "Javascript/Liquid",
      imageDesktop: "assets/projects/fiosoul.png",
      imageLarge: "assets/projects/fiosoulGG.png",
      imageMobile: "assets/projects/fiosoulmob.jpeg",
      displayTitle: false,
      urlSite: 'https://www.fiosoul.com.br/'),
  Projects(
      name: "Sem Etiqueta (Velty)",
      type: "Javascript",
      imageDesktop: "assets/projects/stq.png",
      imageLarge: "assets/projects/stqGG.png",
      imageMobile: "assets/projects/stqmob.jpeg",
      displayTitle: false,
      urlSite: 'https://www.semetiqueta.com.br/'),
  // Projects(
  //     name: "Calculadora Básica",
  //     type: "Javascript/NodeJS",
  //     imageDesktop: "assets/projects/calc.jpeg",
  //     imageLarge: "assets/projects/calcGG.jpeg",
  //     imageMobile: "assets/projects/calcmob.jpeg",
  //     displayTitle: false,
  //     urlSite: 'https://basicalculatormath.web.app/'),
];

class AboutMeObject {
  final String title;
  final List<String> texts;

  AboutMeObject({required this.title, required this.texts});
}

List<AboutMeObject> aboutMeList = [
  AboutMeObject(title: "Objetivo profissional", texts: [
    "Consolidar carreira como desenvolvedor web/mobile, com foco em front-end."
  ]),
  AboutMeObject(title: "Formação", texts: [
    "(2023-Atualmente) Graduando em Sistemas para Internet",
    "(2022-2024) Técnico em TI, com ênfase em informática para Internet",
    "(2014-2019) Bacharelado em Geofísica (primeiro contato com programação em Python)."
  ]),
  AboutMeObject(title: "Experiência Profissional", texts: [
    "(2024-Atualmente) Trainee: Desenvolvedor Front-End na Velty (React, React Native, Next)",
    "(2023-2024) Estagio: Desenvolvedor Front-End na Velty (React, React Native, Next)",
    "(2022-Atualmente) Freelancer: Desenvolvimento de sites e aplicativos (Flutter)",
    "(2022-Atualmente) Voluntário: Desenvolvedor Front-End na Plataforma Obama do Instituto Metrópole Digital (Flutter).",
  ])
];
