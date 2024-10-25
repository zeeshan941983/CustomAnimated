import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Holographic Effect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Holographic Effect Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> letters = ["F", "L", "U", "T", "T", "E", "R"];
  String selectedLetter = "F";

  // Define color palettes for each letter
  final Map<String, List<Color>> letterColorPalettes = {
    "F": [
      Colors.deepPurple.shade100.withOpacity(0.3),
      Colors.deepPurple.shade200.withOpacity(0.4),
      Colors.deepPurple.shade300.withOpacity(0.5),
      Colors.deepPurple.shade400.withOpacity(0.6),
      Colors.deepPurple.shade500.withOpacity(0.7),
    ],
    "L": [
      Colors.indigo.shade100.withOpacity(0.3),
      Colors.indigo.shade200.withOpacity(0.4),
      Colors.indigo.shade300.withOpacity(0.5),
      Colors.indigo.shade400.withOpacity(0.6),
      Colors.indigo.shade500.withOpacity(0.7),
    ],
    "U": [
      Colors.blue.shade100.withOpacity(0.3),
      Colors.blue.shade200.withOpacity(0.4),
      Colors.blue.shade300.withOpacity(0.5),
      Colors.blue.shade400.withOpacity(0.6),
      Colors.blue.shade500.withOpacity(0.7),
    ],
    "T": [
      Colors.green.shade100.withOpacity(0.3),
      Colors.green.shade200.withOpacity(0.4),
      Colors.green.shade300.withOpacity(0.5),
      Colors.green.shade400.withOpacity(0.6),
      Colors.green.shade500.withOpacity(0.7),
    ],
    "E": [
      Colors.yellow.shade100.withOpacity(0.3),
      Colors.yellow.shade200.withOpacity(0.4),
      Colors.yellow.shade300.withOpacity(0.5),
      Colors.yellow.shade400.withOpacity(0.6),
      Colors.yellow.shade500.withOpacity(0.7),
    ],
    "R": [
      Colors.orange.shade100.withOpacity(0.3),
      Colors.orange.shade200.withOpacity(0.4),
      Colors.orange.shade300.withOpacity(0.5),
      Colors.orange.shade400.withOpacity(0.6),
      Colors.orange.shade500.withOpacity(0.7),
    ],
  };
  List<String> emojis = ["🎉", "💜", "😂", "😍", "🤩", "🥶", "🥴"];
  String selectedEmoji = "💜";
  @override
  Widget build(BuildContext context) {
    List<Color> selectedColorPalette =
        letterColorPalettes[selectedLetter] ?? [];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tilt(
              borderRadius: BorderRadius.circular(50),
              tiltConfig: const TiltConfig(angle: 5),
              lightConfig: const LightConfig(
                minIntensity: 0.1,
              ),
              shadowConfig: const ShadowConfig(
                minIntensity: 0.05,
                maxIntensity: 0.4,
                offsetFactor: 0.08,
                minBlurRadius: 10,
                maxBlurRadius: 20,
              ),
              child: SizedBox(
                height: 800,
                width: 400,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TiltParallax(
                      size: const Offset(30, 30),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: selectedColorPalette[0],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    TiltParallax(
                      size: const Offset(23, 23),
                      child: Container(
                        height: 270,
                        width: 270,
                        decoration: BoxDecoration(
                          color: selectedColorPalette[1],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    TiltParallax(
                      size: const Offset(15, 15),
                      child: Container(
                        height: 230,
                        width: 230,
                        decoration: BoxDecoration(
                          color: selectedColorPalette[2],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    TiltParallax(
                      size: const Offset(10, 10),
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: selectedColorPalette[3],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    TiltParallax(
                      size: const Offset(7, 7),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: selectedColorPalette[4],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 375,
                      right: 170,
                      child: TiltParallax(
                        size: const Offset(5, 5),
                        child: Text(selectedEmoji,
                            style: GoogleFonts.roboto(
                              fontSize: 40,
                              color: Colors.black
                                  .withOpacity(selectedColorPalette[4].opacity),
                            )),
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      child: TiltParallax(
                        size: const Offset(10, 10),
                        child: SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemExtent: 50,
                            itemCount: letters.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedLetter = letters[index];
                                    selectedEmoji = emojis[index];
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color:
                                        letterColorPalettes[letters[index]]![2],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      letters[index],
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
