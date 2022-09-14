import 'package:flutter/material.dart';
import 'package:amuse/utilities/dictionary.dart';
import 'package:amuse/utilities/doodle.dart';
import 'package:amuse/utilities/jokes.dart';
import 'package:amuse/utilities/quotes.dart';
import 'package:amuse/utilities/username.dart';

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
    return Card(
        elevation: 20,
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: ListTile(
          leading: Icon(widget.icon),
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          onTap: (openScreen),
        ));
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
