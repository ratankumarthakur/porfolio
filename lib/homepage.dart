import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dsa/AboutSection.dart';
import 'package:dsa/ProjectsSection.dart';
import 'package:dsa/SkillsSection.dart';
import 'package:dsa/ContactSection.dart';
import 'package:dsa/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool dark = false, selected = true;
  final itemKeys = List.generate(5, (_) => GlobalKey());
  final List<String> _images = [
    'assets/images/flutter.png',
    'assets/images/reliance.png',
    'assets/images/video.png',
  ];
  int _currentIndex = 0;
  Timer? _timer;
  final _isHovered = List.generate(5, (_) => false);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      setState(() => _currentIndex = (_currentIndex + 1) % _images.length);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> scrollToItem(int i) async {
    final context = itemKeys[i].currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(context,
          duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    final sections = ["Home", "About", "Skills", "Projects", "Contact"];
    final sectionWidgets = [
      _animatedImage(context), // Home section
      const AboutSection(), // About section widget from about.dart
      SkillCard(col: dark), // Skills section widget from skills.dart
      const ProjectsSection(), // Projects section widget from projects.dart
      const Contact(), // Contact section
    ];
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          children: [
            Text(
              "R",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "atan",
              style: TextStyle(
                  color:Theme.of(context).colorScheme.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          for (int i = 0; i < sections.length; i++) ...[
            InkWell(
              onTap: () => scrollToItem(i),
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered[i] = true),
                onExit: (_) => setState(() => _isHovered[i] = false),
                child: _navButton(sections[i], _isHovered[i],
                    [50, 50, 45, 65, 70][i] as double),
              ),
            ),
            const SizedBox(width: 30),
          ],
          IconButton(
            onPressed: () {
              setState(() {
                selected=!selected;
              });
              Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
            },
            icon: selected
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            sectionWidgets.length,
            (i) => Container(
              key: itemKeys[i],
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              
              child: sectionWidgets[i],
            ),
          ),
        ),
      ),
    );
  }

  Widget atext() {
    return SizedBox(
      width: 450.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
          fontFamily: 'Poppins',
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText('Flutter app developer',
                speed: const Duration(milliseconds: 100)),
            TypewriterAnimatedText('Programming enthusiast',
                speed:const Duration(milliseconds: 100)),
            TypewriterAnimatedText('Reliance Foundation Scholar',
                speed: const Duration(milliseconds: 100)),
            TypewriterAnimatedText('Video Editor',
                speed:const Duration(milliseconds: 100)),
          ],
        ),
      ),
    );
  }

  // ...existing code...
  Widget _animatedImage(BuildContext context) => Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: Image.asset(
              _images[_currentIndex],
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(.7),
              key: ValueKey<int>(_currentIndex),
              fit: BoxFit.cover, // Changed from BoxFit.fill to BoxFit.cover
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Hello , I am Ratan Thakur",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "I am a",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          atext(),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.grey.withOpacity(.2),
                    foregroundImage: const AssetImage("assets/images/ratan.png"),
                  ),
                ],
              )),
        )
      ]);
// ...existing code...

  Widget _navButton(String t, bool s, double n) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            t,
            style: TextStyle(
                color: s ? const Color(0xfffc0362) :Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: s ? 1.0 : 0.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: s ? n : 0,
              curve: Curves.easeIn,
              height: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfffc0362),
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
          ),
        ],
      );
}
