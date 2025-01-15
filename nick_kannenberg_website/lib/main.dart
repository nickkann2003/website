import 'package:flutter/material.dart';
import 'package:nick_kannenberg_website/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 194, 234, 255),
        body: Column(
          children: [
            // Header sized box
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 300,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignOutside)),
                  ),
                  // Cover image
                  Image(
                    image: AssetImage('images/PersonalWebsiteBG.png'),
                    fit: BoxFit.fitHeight,
                    height: 300,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                children: [
                  spacer(context),
                  mainGrid(context),
                  spacer(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget spacer(BuildContext context) {
  double w = MediaQuery.sizeOf(context).width;
  double width = (MediaQuery.sizeOf(context).width - 1264) / 2;
  if (w < 1264) {
    width = (MediaQuery.sizeOf(context).width - 632) / 2;
    if (w < 632) {
      width = (MediaQuery.sizeOf(context).width - 300) / 2;
    }
  }

  if (width < 0) {
    width = 0;
  }
  return SizedBox(
    width: width,
    height: 10,
  );
}

Widget mainGrid(BuildContext context) {
  double w = MediaQuery.sizeOf(context).width;
  int cAC = 2;
  if (w < 1264) {
    cAC = 1;
  }

  double aspectRatio = 2;
  double maxWidth = 1264;
  if (w < 1264) {
    maxWidth = 632;
    if (w < 632) {
      maxWidth = 280;
      aspectRatio = 0.5;
    }
  }

  double maxHeight = MediaQuery.sizeOf(context).height - 306;

  return ConstrainedBox(
    constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
    child: GridView.count(
      crossAxisCount: cAC,
      childAspectRatio: aspectRatio,
      shrinkWrap: false,
      children: [
        Utils().gameDisplay(context, "PersonalWebsiteToastIcon.png", [
          "Sometimes Toast is O.K.",
          "Project Lead",
          "Point-and-click adventure casual game, part of the RIT MAGIC Maker program\n2023 - Ongoing",
          "Project Management, Unity, C#, Marketing, Photoshop, Stakeholder Reporting, Steamworks",
        ], color: const Color.fromARGB(255, 183, 247, 255), link: Uri(scheme: 'https', host: 'www.linktr.ee', path: "sometimestoastisok")),
        Utils().gameDisplay(context, "PersonalWebsiteNLOL.png", [
          "Nine Lives, One Law",
          "Developer, UI",
          "Top-down roguelike revolving around a Quick Time Event duel mechanic\n2024",
          "Unity, C#, Photoshop, Audacity",
        ], color: const Color.fromARGB(255, 255, 230, 183),),
        Utils().gameDisplay(context, "PersonalWebsiteToastToppings.png", [
          "Sometimes Toast has Toppings",
          "Solo Project",
          "Web-based, flutter made game about selecting toppings for toast and recieving a score\n2024",
          "Flutter, Dart, Photoshop, Audacity",
        ], color: const Color.fromARGB(255, 183, 255, 219), link: Uri(scheme: 'https', host: 'people.rit.edu', path: "nrk5987/toast/web/")),
        Utils().gameDisplay(context, "PersonalWebsiteFloatsom.png", [
          "Floatsom",
          "Solo Game Jam Project",
          "Monogame solo Game Jam project, my first Game Jam project, simple rounded experience\n2022",
          "Monogame, C#, Photoshop",
        ], color: const Color.fromARGB(255, 243, 243, 243), link: Uri(scheme: 'https', host: 'www.github.com', path: "nickkann2003/GGJ2022/")),
        Utils().gameDisplay(context, "PersonalWebsiteSparassidae.png", [
          "Sparassidae",
          "Developer",
          "Group project created in Monogame, a short horror game about avoiding spiders and navigating a level\n2022",
          "Monogame, C#, Audacity, Windows Forms, Penumbra",
        ], color: const Color.fromARGB(255, 221, 189, 189), link: Uri(scheme: 'https', host: 'www.github.com', path: "4rt3ry/Sparassidae")),
        Utils().gameDisplay(context, "PersonalWebsiteDisoriented.png", [
          "Combat Disoriented",
          "Solo Project",
          "Java-based roguelike based around swapping colors and navigating a complex, puzzling map that constantly changes\n2021 - 2022",
          "Java, LibGDX, Steamworks, Photoshop, Audacity",
        ], color: const Color.fromARGB(255, 244, 245, 225), link: Uri(scheme: 'https', host: 'www.gitlab.com', path: "nickkann2003/prototype1/-/tree/master/runnables")),
      ],
    ),
  );
}
