import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Jokes extends StatefulWidget {
  const Jokes({Key? key}) : super(key: key);

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  String _joke = "";
  bool _isLoading = false;

  _getJoke() async {
    var url = Uri.https('v2.jokeapi.dev', '/joke/Any', {
      'type': 'single',
      'blacklistFlags': ['nsfw', 'racist', 'sexist', 'explicit']
    });
    // Await the http get response, then decode the json-formatted response.
    setState(() {
      _isLoading = true;
    });
    var response = await http.get(url);
    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Number of books about http: ${jsonResponse['joke']}');

      setState(() {
        _joke = jsonResponse['joke'];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
      setState(() {
        _joke = "Oh no! There seems to be some error. Please come back after a few minutes.";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getJoke();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        _getJoke();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Updated!'),
        ));
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: !_isLoading ? Text(
                      _joke,
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ) : const CircularProgressIndicator(),
                  ),
                ],
              )),
              const Center(
                child: Text(
                  "Shake to generate new joke!",
                ),
              ),
            ]),
      ),
    );
  }
}
