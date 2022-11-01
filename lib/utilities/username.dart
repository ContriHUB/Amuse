import 'package:flutter/material.dart';
import 'package:username_generator/username_generator.dart';

class Username extends StatefulWidget {
  const Username({Key? key}) : super(key: key);

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  String _firstName = "";
  String _lastName = "";
  final List<String> _adj = [];
  bool _random = false;

  var generator = UsernameGenerator();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _firstName = _firstNameController.text;
                      _lastName = _lastNameController.text;
                      _random = false;
                    });
                  },
                  child: const Text("Generate random username.")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _random = true;
                    });
                  },
                  child: const Text("Generate Without parameters")),
              printUsername(_firstName, _lastName, _random)
            ],
          ),
        ),
      ),
    );
  }

  Widget printUsername(String _firstName, String _lastName, bool random) {
    var _genUsername =
        generator.generateForName(_firstName, lastName: _lastName);

    if (_random) {
      var _genUsername = generator.generateRandom();
      return Text(_genUsername);
    }
    if (_firstName.isEmpty) {
      return const Text("First Name Cannot be Empty");
    }
    if (_lastName.isEmpty) {
      return const Text("Last Name Cannot be Empty");
    }

    return Text(
      "Your Generated Username: $_genUsername",
      style: const TextStyle(fontSize: 20),
    );
  }
}
