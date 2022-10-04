import 'package:flutter/material.dart';
import 'package:dictionaryx/dictentry.dart';
import 'package:dictionaryx/dictionary_msa_json_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({Key? key}) : super(key: key);

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  final cText = TextEditingController();
  final dMSAJson = DictionaryMSAFlutter();
  DictEntry _entry = DictEntry('', [], [], []);
  bool _searched = false;
  bool _shouldFade = false;

  void lookupWord() async {
    setState(() {
      _searched = true;
    });
    DictEntry? tmp;
    final txt = cText.text.trim();
    if (await dMSAJson.hasEntry(txt)) {
      var s = Stopwatch()..start();
      tmp = await dMSAJson.getEntry(txt);
      s.stop();
    }
    setState(() {
      if (tmp != null) {
        _entry = tmp;
      } else {
        _entry = DictEntry('', [], [], []);
      }
      _shouldFade = true;
    });
  }

  Widget renderEntry() {
    return Neumorphic(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      style: const NeumorphicStyle(
        surfaceIntensity: .1,
        color: Color(0xFF26282c),
        shadowLightColor: Color.fromARGB(255, 103, 106, 111),
        shadowDarkColor: Color(0xFF000000),
        depth: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                cText.text.toUpperCase(),
                textScaleFactor: 3,
                style: const TextStyle(color: Colors.pinkAccent),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'MEANINGS ',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(_entry.meanings[0].description,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: 20,
            ),
            Text(
              'SYNONYMS ',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text((_entry.synonyms.isEmpty) ? '-' : _entry.synonyms.toString(),
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: 20,
            ),
            Text(
              'ANTONYMS ',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text((_entry.antonyms.isEmpty) ? '-' : _entry.antonyms.toString(),
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searched
            ? const Text(
                'Dictionary',
                style: TextStyle(color: Colors.pinkAccent),
              )
            : const Text(""),
      ),
      body: (_searched == false)
          ? Scrollbar(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  Neumorphic(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(8),
                    style: const NeumorphicStyle(
                      surfaceIntensity: .1,
                      color: Color(0xFF26282c),
                      shadowLightColor: Color.fromARGB(255, 103, 106, 111),
                      shadowDarkColor: Color(0xFF000000),
                      depth: 5,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Dictionary",
                            textScaleFactor: 3.5,
                            style: TextStyle(
                              color: Colors.pinkAccent,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter a word',
                              suffixIcon: IconButton(
                                onPressed: () => lookupWord(),
                                icon: const Icon(Icons.search),
                              ),
                            ),
                            onFieldSubmitted: (_) => lookupWord(),
                            controller: cText,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Neumorphic(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(8),
                    style: const NeumorphicStyle(
                      surfaceIntensity: .1,
                      color: Color(0xFF26282c),
                      shadowLightColor: Color.fromARGB(255, 103, 106, 111),
                      shadowDarkColor: Color(0xFF000000),
                      depth: 5,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter a word',
                              suffixIcon: IconButton(
                                onPressed: () => lookupWord(),
                                icon: const Icon(Icons.search),
                              ),
                            ),
                            onFieldSubmitted: (_) => lookupWord(),
                            controller: cText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_entry.word.isNotEmpty)
                    renderEntry()
                  else
                    const Text("Word Not Found...")
                ],
              ),
            ),
    );
  }
}
