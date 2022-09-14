// ignore: file_names
import 'package:flutter/material.dart';
import 'package:amuse/widgets/HomeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("AMUSE")),
        body: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context, index) => cardList[index],
        ));
  }

  List<HomeCard> cardList = [
    const HomeCard(
      title: "Quotes",
      color: Colors.lightBlue,
      icon: Icons.format_quote,
      subtitle: "Generate a random motivational quote",
    ),
    const HomeCard(
      title: "Jokes",
      color: Colors.lightGreen,
      icon: Icons.sentiment_very_satisfied,
      subtitle: "Generate a random joke",
    ),
    const HomeCard(
      title: "Username Generator",
      color: Colors.deepPurple,
      icon: Icons.person_rounded,
      subtitle: "Generate a list of valid usernames",
    ),
    const HomeCard(
      title: "Dictionary",
      color: Colors.pinkAccent,
      icon: Icons.wordpress,
      subtitle: "Look up words",
    ),
    const HomeCard(
      title: "Doodle",
      color: Colors.amber,
      icon: Icons.draw,
      subtitle: "Create freehand doodles",
    ),
  ];
}
