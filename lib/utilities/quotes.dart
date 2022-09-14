import 'package:flutter/material.dart';
import 'package:quoter/quoter.dart';
import 'package:shake/shake.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key, this.quoter = const Quoter()}) : super(key: key);
  final Quoter quoter;
  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  Quote? _quote;

  void _generateRandomQuote() {
    setState(() {
      _quote = widget.quoter.getRandomQuote();
    });
  }

  @override
  void initState() {
    super.initState();
    _generateRandomQuote();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        _generateRandomQuote();
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
        title: const Text('Quotes'),
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
                    child: Text(
                      _quote?.quotation ??
                          "Oh no! There seems to be some error. Please come back after a few minutes.",
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    _quote?.quotee ?? "",
                    textAlign: TextAlign.right,
                  ),
                ],
              )),
              const Center(
                child: Text(
                  "Shake to generate new quote!",
                ),
              ),
            ]),
      ),
    );
  }
}
