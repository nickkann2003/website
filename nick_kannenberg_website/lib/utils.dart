import 'package:flutter/material.dart';
import 'package:nick_kannenberg_website/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Widget gameDisplay(BuildContext context, String imgAddress, List<String> text,
      {color = Colors.red, Uri? link}) {
    // Values setup, responsiveness
    double w = MediaQuery.sizeOf(context).width;
    bool vertical = false;
    double p = 16.0;
    double maxWidth = 600;
    double maxHeight = 300;
    if (w < 632) {
      vertical = true;
      p = 0.0;
      maxWidth = 300;
      maxHeight = 600;
    }

    Widget itemDisplay;

    // Set actual item display
    if (vertical) {
      itemDisplay = SizedBox(
        width: 280,
        child: Column(
          children: [img(imgAddress, vertical, link), txt(text)],
        ),
      );
    } else {
      itemDisplay = Row(
        children: [img(imgAddress, vertical, link), txt(text)],
      );
    }

    // Construct container
    Widget gameWidget = Padding(
      padding: EdgeInsets.symmetric(horizontal: p, vertical: p + 2),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            minWidth: maxWidth,
            minHeight: maxHeight),
        child: Container(
          decoration: BoxDecoration(
              color: color, border: Border.all(color: Colors.black, width: 5)),
          child: itemDisplay,
        ),
      ),
    );

    // Return widget
    return gameWidget;
  }

  Widget img(String img, bool vertical, Uri? link) {
    Border border;
    if (vertical) {
      border = Border(bottom: BorderSide(color: Colors.black, width: 5));
    } else {
      border = Border(right: BorderSide(color: Colors.black, width: 5));
    }
    if (link == null) {
      return Container(
          decoration: BoxDecoration(color: Colors.black, border: border),
          child: Image(
            image: AssetImage("images/$img"),
            fit: BoxFit.fitWidth,
          ));
    } else {
      return Container(
          decoration: BoxDecoration(color: Colors.black, border: border),
          child: GestureDetector(
              onTap: () {
                launchUrl(
                  link,
                  mode: LaunchMode.externalApplication,
                );
              }, // Image tapped
              child: Image(
                image: AssetImage("images/$img"),
                fit: BoxFit.fitWidth,
              )));
    }
  }

  Widget txt(List<String> text) {
    return SizedBox(
      width: 310,
      height: 270,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text[0],
              style: textStyles.header,
              textAlign: TextAlign.center,
            ),
            Text(
              text[1],
              style: textStyles.body,
              textAlign: TextAlign.center,
            ),
            Text(" ", style: textStyles.header),
            Text(
              text[2],
              style: textStyles.body,
              textAlign: TextAlign.center,
            ),
            Text(" ", style: textStyles.header),
            Text(
              "Skills: ${text[3]}",
              style: textStyles.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
