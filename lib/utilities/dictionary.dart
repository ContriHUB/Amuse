import 'package:flutter/material.dart';
import 'package:dictionaryx/dictentry.dart';
import 'package:dictionaryx/dictionary_msa_json_flutter.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({Key? key}) : super(key: key);

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  final cText = TextEditingController();
  final dMSAJson = DictionaryMSAFlutter();
  DictEntry _entry = DictEntry('', [], [], []);

  void lookupWord() async {
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
    });
  }

  Widget renderEntry() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Text(_entry.synonyms.toString(),
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(
            height: 20,
          ),
          Text(
            'ANTONYMS ',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(_entry.antonyms.toString(),
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //
            // ENTER WORD
            //
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter a word',
                  suffixIcon: IconButton(
                      onPressed: () => lookupWord(),
                      icon: const Icon(Icons.search))),
              onFieldSubmitted: (_) => lookupWord(),
              controller: cText,
            ),
            const SizedBox(height: 16),
            if (_entry.word.isNotEmpty) const Text("..."),
            if (_entry.word.isNotEmpty) renderEntry()
          ],
        ),
      ),
    );
  }
}
