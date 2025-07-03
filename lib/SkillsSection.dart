import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillCard extends StatefulWidget {
  final bool col;

  const SkillCard({super.key, required this.col});
  @override
  State<SkillCard> createState() => SkillCardState();
}

Future<void> _launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

class SkillCardState extends State<SkillCard> {
  bool _hovered = false, _hovered2 = false, _hovered3 = false;

  TextStyle _getTextStyle(bool isHovered) {
    return TextStyle(
      fontSize: 28,
      color:
           Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.55;
    final double containerWidth = containerHeight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("My Skills",
            style: TextStyle(
              fontSize: 36,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOut,
                margin:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                width: containerWidth,
                height: containerHeight,
                transform: _hovered
                    ? (Matrix4.identity()..translate(0.0, -18.0))
                    : Matrix4.identity(),
                decoration: BoxDecoration(
                  color: _hovered
                      ? Colors.pink[300]
                      : widget.col
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    if (_hovered)
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: fun3(
                  _hovered,
                  "Frontend",
                  "Technologies known",
                  "Flutter (dart)",
                  "HTML",
                  "CSS",
                  "https://roadmap.sh/flutter",
                  FontAwesomeIcons.flutter,
                  _getTextStyle,
                ),
              ),
            ),
            MouseRegion(
              onEnter: (_) => setState(() => _hovered2 = true),
              onExit: (_) => setState(() => _hovered2 = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOut,
                margin:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                width: containerWidth,
                height: containerHeight,
                transform: _hovered2
                    ? (Matrix4.identity()..translate(0.0, -18.0))
                    : Matrix4.identity(),
                decoration: BoxDecoration(
                  color: _hovered2
                      ? Colors.pink[300]
                      : widget.col
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    if (_hovered2)
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: fun3(_hovered2, "Backend",
                  "Technologies known",
                  "Node.js",
                  "Express.js",
                  "Firebase",
                  "https://roadmap.sh/backend",
                  FontAwesomeIcons.server,
                  _getTextStyle,)
              ),
            ),
            MouseRegion(
              onEnter: (_) => setState(() => _hovered3 = true),
              onExit: (_) => setState(() => _hovered3 = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOut,
                margin:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                width: containerWidth,
                height: containerHeight,
                transform: _hovered3
                    ? (Matrix4.identity()..translate(0.0, -18.0))
                    : Matrix4.identity(),
                decoration: BoxDecoration(
                  color: _hovered3
                      ? Colors.pink[300]
                      : widget.col
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    if (_hovered3)
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: fun3(_hovered3, "Programming",
                  "Languages known",
                  "C++",
                  "Python(basics)",
                  "",
                  "https://roadmap.sh/cpp",
                  FontAwesomeIcons.code,
                  _getTextStyle,)
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

Widget text_button(String buttonText, String url, bool _hovered) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: _hovered ? Colors.white : Colors.pink,
      //backgroundColor: _hovered ? Colors.pink : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    onPressed: () => _launchUrl(url),
    child: Text(buttonText),
  );
}

Widget fun3(
    bool _hovered,
    String t1,
    String t2,
    String t3,
    String t4,
    String t5,
    String url,
    IconData ic,
    TextStyle Function(bool) _getTextStyle) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaIcon(
          ic,
          color: Colors.blue,
          size: 45,
        ),
        SizedBox(height: 25),
        Text(
          t1,
          style: _getTextStyle(_hovered),
          
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t2,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Text(t3,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Text(t4,style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Text(t5,style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        const SizedBox(height: 40),
        text_button("See roadmap", url, _hovered)
      ],
    ),
  );
}
