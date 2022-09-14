import 'package:flutter/material.dart';
import 'package:username_generator/username_generator.dart';

class Username extends StatefulWidget {
  const Username({Key? key}) : super(key: key);

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  String? _username;
  var generator = UsernameGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _username = generator.generateRandom();
                  });
                },
                child: const Text("Generate random username.")),
            printUsername()
          ],
        ),
      ),
    );
  }

  Widget printUsername() {
    if (_username?.isEmpty ?? true) {
      return Text("");
    }
    return Container(
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
        child: Text(
          'Generated username : $_username',
          style: Theme.of(context).textTheme.bodyMedium,
        ));
  }
}
