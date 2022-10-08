import 'package:flutter/material.dart';
import 'package:draw_your_image/draw_your_image.dart';

class Doodle extends StatefulWidget {
  const Doodle({Key? key}) : super(key: key);

  @override
  State<Doodle> createState() => _DoodleState();
}

class _DoodleState extends State<Doodle> {
  var _currentColor = Colors.black;
  var _currentWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('draw_your_image example'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Text('DRAW WHAT YOU WANT!'),
            const SizedBox(height: 120),
            Expanded(
              child: Draw(strokeColor: _currentColor,strokeWidth: _currentWidth,),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              children: [
                Colors.black,
                Colors.blue,
                Colors.red,
                Colors.green,
                Colors.yellow
              ].map(
                (color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentColor = color;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 40,
                        height: 40,
                        color: color,
                        child: Center(
                          child: _currentColor == color
                              ? const Icon(
                                  Icons.brush,
                                  color: Colors.white,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 32),
            Slider(
              max: 40,
              min: 1,
              value: _currentWidth,
              onChanged: (value) {
                setState(() {
                  _currentWidth = value;
                });
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}