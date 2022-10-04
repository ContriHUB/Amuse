import 'package:flutter/material.dart';
import 'package:amuse/utilities/dictionary.dart';
import 'package:amuse/utilities/doodle.dart';
import 'package:amuse/utilities/jokes.dart';
import 'package:amuse/utilities/quotes.dart';
import 'package:amuse/utilities/username.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    required this.subtitle,
  }) : super(key: key);

  final title;
  final color;
  final icon;
  final subtitle;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          elevation: 10,
          color: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: (openScreen),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.white,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            widget.subtitle,
                            style: GoogleFonts.rubik(color: Colors.white),
                          ),
                        ])
                  ],
                ),
              ),
            ),
          )),
    );
  }

  openScreen() {
    switch (widget.title) {
      case "Quotes":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Quotes()));
        break;
      case "Jokes":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Jokes()));
        break;
      case "Username Generator":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Username()));
        break;
      case "Dictionary":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dictionary()));
        break;
      case "Doodle":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Doodle()));
        break;
    }
  }
}
